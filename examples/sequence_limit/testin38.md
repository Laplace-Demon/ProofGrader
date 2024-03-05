要证： 
$$
\lim\limits_{x \to 0} {\frac{x ^ {3}}{3 * \sin{x} - \sin{3 * x}} } = \frac{1}{4}
$$

证：

易知：
$$
\lim\limits_{x \to 0} {\frac{x ^ {3}}{3 * \sin{x} - \sin{3 * x}} } = \lim\limits_{x \to 0} {\frac{3 * x ^ {2}}{3 * \cos{x} - 3 * \cos{3 * x}} } = \lim\limits_{x \to 0} {\frac{x ^ {2}}{\cos{x} - \cos{3 * x}} } = \lim\limits_{x \to 0} {\frac{2 * x}{3 * \sin{3 * x} - \sin{x}} } = \lim\limits_{x \to 0} {\frac{2}{9 * \cos{3 * x} - \cos{x}} } = \frac{1}{4}
$$
,
综上可知，原命题得证。