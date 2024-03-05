要证： 
$$
\lim\limits_{x \to 0} {\frac{x * \sin{x} - (\sin{x}) ^{2}}{(e ^{x} - 1) * (1 - \cos{x}) * (x ^{2} + 2 * x)}} = \frac{1}{6}

$$
证：

易知：
$$
\lim\limits_{x \to 0} {\frac{x * \sin{x} - (\sin{x}) ^{2}}{(e ^{x} - 1) * (1 - \cos{x}) * (x ^{2} + 2 * x)}} = \lim\limits_{x \to 0} {\frac{\sin{x} * (x - \sin{x})}{(e ^{x} - 1) * (1 - \cos{x}) * (x ^{2} + 2 * x)}} = \lim\limits_{x \to 0} {\frac{\sin{x} * (x - \sin{x})}{(e ^{x} - 1) * (1 - \cos{x}) * ((1 + x) ^{2} - 1)}} = \lim\limits_{x \to 0} {\frac{x * (x - \sin{x})}{(e ^{x} - 1) * (1 - \cos{x}) * ((1 + x) ^{2} - 1)}} = \lim\limits_{x \to 0} {\frac{x * \frac{x ^{3}}{6}}{(e ^{x} - 1) * (1 - \cos{x}) * ((1 + x) ^{2} - 1)}} = \lim\limits_{x \to 0} {\frac{x * \frac{x ^{3}}{6}}{x * (1 - \cos{x}) * ((1 + x) ^{2} - 1)}} = \lim\limits_{x \to 0} {\frac{x * \frac{x ^{3}}{6}}{x * \frac{x ^{2}}{2} * ((1 + x) ^{2} - 1)}} = \lim\limits_{x \to 0} {\frac{x * \frac{x ^{3}}{6}}{x * \frac{x ^{2}}{2} * (2 * x)}} = \lim\limits_{x \to 0} {\frac{\frac{x ^{4}}{6}}{x ^{4}}} = \lim\limits_{x \to 0} {\frac{1}{6} * \frac{x ^{4}}{x ^{4}}} = \frac{1}{6}
$$
,
综上可知，原命题得证。