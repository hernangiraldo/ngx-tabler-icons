#!/bin/bash

temp_file=$(mktemp)
length=$(jq '. | length' icons.json)
max_width=50

for i in $(seq 0 $(($length-1))); do
n_value=$(jq -r ".[$i].n" icons.json)
  n_value_case=$(jq -r ".[$i].n" icons.json | sed 's/-/ /g' | awk '{ for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); }1' | sed 's/ //g')
  s_value=$(jq -r ".[$i].s" icons.json | \
  sed 's/width=\"24\"/[attr.width]=\"size\"/g' | \
  sed 's/height=\"24\"/[attr.height]=\"size\"/g' | \
  sed 's/stroke-width=\"2\"/[attr.stroke-width]=\"strokeWidth\"/g')

  cat << EOF > src/lib/$n_value.component.ts
  import { Component, Input, Inject, Optional, ChangeDetectionStrategy } from '@angular/core';

@Component({
  selector: 'i-tabler-$n_value',
  standalone: true,
  template: \`
    $s_value
  \`,
  styles: [
    \`
      :host {
        display: inline-flex;
        align-items: center;
        justify-content: center;
      }
    \`,
  ],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class ITabler${n_value_case}Component {
  @Input() size = 24;
  @Input() strokeWidth = this.defaultStrokeWidth || 1.5;

  constructor(
    @Optional()
    @Inject('TABLER_ICON_STROKE_WIDTH')
    private defaultStrokeWidth: number
  ) {}
}
EOF

  echo "export * from './lib/$n_value.component';" >> "$temp_file"

   # Cálculo del progreso
  progress=$(( ($i * $max_width) / $length ))
  
  # Crear la barra de progreso
  bar=$(printf '%0.s#' $(seq 1 $progress))
  spaces=$(printf '%0.s ' $(seq 1 $(($max_width - $progress))))
  
  # Imprimir la barra de progreso
  printf "\r[%s%s] %d%%" "$bar" "$spaces" $(( ($progress * 100) / $max_width ))
done

cp "$temp_file" src/public-api.ts
rm "$temp_file"