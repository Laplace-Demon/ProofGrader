Goal:
$$
\lim\limits_ {n \to \infty} {\frac{3*n}{5*n+2}} = \frac{3}{5}
$$

证：

使用极限定义证明。

取a，
满足 $a \gt 0$，

令N=$\lceil { \frac{6}{25} * \frac{1}{a} } \rceil$

取n
满足$n\gt N$，

可知：
$$
   \frac{3}{5} - a \le \frac{3*n}{5*n+2} \le \frac{3}{5} + a
$$
易知
$$
|\frac{3*n}{5*n+2} - \frac{3}{5}| = \frac{6}{25*n + 10} 
\le \frac{6}{25*n} \le a
$$
综上可知，原命题得证。