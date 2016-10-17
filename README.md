# mdi-svg
[Community Material Design Icons](https://materialdesignicons.com/) as SVG path data.

Contains helper functions for rendering to SVG strings and React components.

Patch number corresponds to the number of commits in [MaterialDesign@master](https://github.com/Templarian/MaterialDesign)

Special thanks to [Austin Andrews](https://github.com/Templarian) for managing Material Design Icons.

## Installation

```
npm install mdi-svg
```

## Usage

```js
import AccountIconData from 'mdi-svg/d/account';
import { toPathString, toSvgString, toPath, toSvg } from 'mdi-svg'

// '<path d="..." />'
export const AccountIconPathString = toPathString(AccountIconData)

// '<svg xmlns="..." ...><path d="..." /></svg>'
export const AccountIconString = toSvgString(AccountIconData)

import React from 'react'

// react component <AccountIconPath />
export const AccountIconPath = toPath(React)(AccountIconData)

// react component <AccountIcon />
export const AccountIcon = toSvg(React)(AccountIconData)
```

## Build

```sh
make init
```
