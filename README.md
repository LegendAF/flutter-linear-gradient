# flutter_linear_gradient

GradientTransform doesn't act as I would expect but based on the [docs](https://main-api.flutter.dev/flutter/painting/GradientTransform-class.html) it's [working as intended](https://github.com/flutter/flutter/issues/157475#issuecomment-2445531136).

If you want a working solution you can do something like:

```
Alignment alignmentFromDegrees(double degree) {
  final x = cos(degree * pi / 180);
  final y = sin(degree * pi / 180);
  final xAbs = x.abs();
  final yAbs = y.abs();

  if ((0.0 < xAbs && xAbs < 1.0) || (0.0 < yAbs && yAbs < 1.0)) {
    return Alignment(-x, -y) *
        ((1 / xAbs) < (1 / yAbs) ? (1 / xAbs) : (1 / yAbs));
  } else {
    return Alignment(-x, -y);
  }
}

const LinearGradient(
  begin: alignmentFromDegrees(90),
  end: -alignmentFromDegrees(90),
  colors: [
    Colors.black,
    Colors.white,
  ],
  stops: [0, 1],
);
```
