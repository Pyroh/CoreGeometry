
![](https://img.shields.io/badge/Swift-5.0-orange.svg)
![](https://img.shields.io/badge/Platforms-macOS|iOS|tvOS|wathOS-green.svg)
[![](https://img.shields.io/badge/Documentation-Dash-purple.svg)]()

![](https://raw.githubusercontent.com/Pyroh/CoreGeometry/master/resources/Title.png)

CoreGeometry is a set of Core Graphics structs extensions and utility functions. It also offers a set of extensions and utility fonction for some Swift's numeric type.

## Summary
- [Installation]()
- [Numeric types additions]()
- [`CGPoint` additions]()
- [`CGVector` addition]()
- [`CGRect` additions]()
- [Contribute]()
- [License]()

## Installation

```Text
dependencies: [
    // Dependencies declare other packages that this package depends on.
    .package(url: "https://gitlab.com/Pyroh/CoreGeometry.git", .upToNextMajor(from: "4.0.0")),
],
```


## Numeric types additions
### The `°` operator
CoreGeometry adds a new postfixed operator `°` to both `IntegerLiteralType` and `FloatIntegerLiteral`. What it does is to consider the literal as an angle expressed in degrees and convert it in radian.

As a result we can assert that :

```Swift
45° == CGFloat.pi / 4
90.0° == CGFloat.pi / 2
```

It helps you to express angles in degree and pass them directly to CoreGraphics functions.

## `CGPoint` additions
> WIP

## `CGVector` additions
> WIP

## `CGRect` additions
> WIP

## Contribute
> WIP

## License

See LICENSE
