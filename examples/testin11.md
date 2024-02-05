Goal: 
$$
\lim\limits_{x \to 0} {\frac{(\sin{x} - \sin{\sin{x}}) * \sin{x}}{x ^{4}}} = \frac{1}{6}
$$

证：

易知：
$$
\lim\limits_{x \to 0} {\frac{(\sin{x} - \sin{\sin{x}}) * \sin{x}}{x ^{4}}} = \lim\limits_{x \to 0} {\frac{(\sin{x} - \sin{\sin{x}}) * x}{x ^{4}}} = \lim\limits_{x \to 0} {\frac{\sin{x} - \sin{\sin{x}}}{x ^{3}}} = \lim\limits_{x \to 0} {\frac{\cos{x} - \cos{\sin{x}} * \cos{x}}{3 * x ^{2}}} = \lim\limits_{x \to 0} {\frac{\cos{x}}{3}} * \lim\limits_{x \to 0} {\frac{1 - \cos{\sin{x}}}{x ^{2}}} = \frac{1}{3} * \lim\limits_{x \to 0} {\frac{1 - \cos{\sin{x}}}{x ^{2}}} = \frac{1}{3} * \lim\limits_{x \to 0} {\frac{\frac{1}{2} * \sin{x} ^{2}}{x ^{2}}} = \frac{1}{3} * \lim\limits_{x \to 0} {\frac{\frac{1}{2} * x ^{2}}{x ^{2}}} = \frac{1}{3} * \lim\limits_{x \to 0} {\frac{1}{2}} = \frac{1}{3} * \frac{1}{2} = \frac{1}{6}
$$
综上可知，原命题得证。