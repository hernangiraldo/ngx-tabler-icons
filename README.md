# Ngx Tabler Icons

Welcome to the `NgxTablerIcons` library! This library allows you to effortlessly incorporate [Tabler Icons](https://tabler-icons.io/) within your Angular applications, enhancing your app's user interface with aesthetically pleasing, vector-based icons.

---

#### Important:

At first glance, the library may seem hefty, but it's important to note that it contains all 4018 icons from [Tabler Icons](https://tabler-icons.io/). However, rest assured that this library is fully tree-shakable. In your final bundle, only the icons that you actually use will be included, which helps to optimize the size and performance of your applicat

---

## Acknowledgements

I would like to express our deepest gratitude to the [Tabler Icons](https://tabler-icons.io/) team for creating and providing such a diverse and beautiful set of icons. The elegance and simplicity of Tabler Icons significantly enrich the user experience of our library, making the visual interface more engaging and intuitive.

## Features

- Easily integrate Tabler Icons in your Angular projects.
- Explore a wide range of icons to match your app’s design.
- SVG-based icons ensure a crisp display on all screen sizes and resolutions.
- Customizable icon size, color, and other SVG properties.
- All the icons from https://tabler-icons.io are available.

## Usage

_1. Install the package_

```sh
npm install ngx-tabler-icons
# or
yarn add ngx-tabler-icons

# or
pnpm install ngx-tabler-icons
```

_2. Import the icon that you want to use_

```ts
@NgModule({
  imports: [ITabler2faModule],
})
export class Module {}
```

```ts
@Component({
  standalon: true,
  imports: [ITabler2faModule],
})
export class Component {}
```

_3. Use it in your template_

```html
<i-tabler-2fa></i-tabler-2fa>
```

_4. Attributes_
| Attribute | Description | Default value|
|---------|----------------------|----|
| size | Set the height and width of the icon | 24 |
| strokeWidth | Set the stroke width of the icon| 1.5 |

_5. If you want to change the default strokeWidth of all the icons, you just need to provide the following value in your app.module.ts_

```ts
@NgModule({
  ...
  providers: [{ provide: 'TABLER_ICON_STROKE_WIDTH', useValue: 3 }],
  ...
})
```

## Contributing

Feel free to contribute to this project by submitting issues or pull requests. We appreciate your feedback and support in making this library better!
