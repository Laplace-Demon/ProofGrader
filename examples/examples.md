Problem: 已知 x, y, z 都是正实数， 且 $x + y + z \ge 1$, 求证
$$\frac{x*\sqrt{x}}{y+z} + \frac{y*\sqrt{y}}{z+x} + \frac{z*\sqrt{z}}{x+y} \ge \frac{\sqrt{3}}{2}$$

修改形式:

前提:
$x \ge 0$,
$y \ge 0$,
$z \ge 0$,
$x + y + z \ge 1$

Proof:

由均值不等式可得
$$x^{\frac{3}{2}} + y^{\frac{3}{2}} + y^{\frac{3}{2}} \ge 3 * x^{\frac{1}{2}} * y$$
$$x^{\frac{3}{2}} + z^{\frac{3}{2}} + z^{\frac{3}{2}} \ge 3 * x^{\frac{1}{2}} * z$$

因此
$$2 * (x^{\frac{3}{2}} + y^{\frac{3}{2}} + z^{\frac{3}{2}}) \ge 3 * x^{\frac{1}{2}} * (y + z)$$

$$\frac{x^{\frac{3}{2}}}{y+z} \ge \frac{3*x^2}{2 * (x^{\frac{3}{2}} + y^{\frac{3}{2}} + z^{\frac{3}{2}})}$$

同理，
$$\frac{y^{\frac{3}{2}}}{z+x} \ge \frac{3*y^2}{2 * (x^{\frac{3}{2}} + y^{\frac{3}{2}} + z^{\frac{3}{2}})}$$

$$\frac{z^{\frac{3}{2}}}{x+y} \ge \frac{3*z^2}{2 * (x^{\frac{3}{2}} + y^{\frac{3}{2}} + z^{\frac{3}{2}})}$$

因此
$$\frac{x*\sqrt{x}}{y+z} + \frac{y*\sqrt{y}}{z+x} + \frac{z*\sqrt{z}}{x+y} \ge \frac{3*(x^2 + y^2 + z^2)}{2 * (x^{\frac{3}{2}} + y^{\frac{3}{2}} + z^{\frac{3}{2}})}$$

要证明原不等式，只需证明：
$$\frac{3*(x^2 + y^2 + z^2)}{2 * (x^{\frac{3}{2}} + y^{\frac{3}{2}} + z^{\frac{3}{2}})} \ge \frac{\sqrt{3}}{2}$$

只需证明：
$$\sqrt{3} * (x^2 + y^2 + z^2) \ge (x^{\frac{3}{2}} + y^{\frac{3}{2}} + z^{\frac{3}{2}})$$

只需证明：
$$3 * (x^2 + y^2 + z^2) ^ 2 \ge (x^{\frac{3}{2}} + y^{\frac{3}{2}} + z^{\frac{3}{2}}) ^ 2$$

由柯西不等式可得
$$(x^2 + y^2 + z^2) * (x + y + z) \ge (x^{\frac{3}{2}} + y^{\frac{3}{2}} + z^{\frac{3}{2}}) ^ 2$$

由柯西不等式可得
$$3 * (x^2 + y^2 + z^2) \ge (x + y + z) ^ 2 \ge x + y + z$$

因此
$$3 * (x^2 + y^2 + z^2) ^ 2 \ge (x^2 + y^2 + z^2) * (3 * (x^2 + y^2 + z^2)) \ge (x^2 + y^2 + z^2) * (x + y + z) \ge (x^{\frac{3}{2}} + y^{\frac{3}{2}} + z^{\frac{3}{2}}) ^ 2$$

该不等式得证

Problem: 求$f(x)=(e^x+\ln{x})\sin{x}$的一阶导数。

修改形式:
证明:
$$((e^x+\ln{x})\sin{x})' = (e^x+\frac{1}{x})\sin{x} + (e^x+\ln{x})(\cos{x})$$

Proof: 
$$((e^x+\ln{x})\sin{x})' = (e^x+\ln{x})'\sin{x} + (e^x+\ln{x})(\sin{x})' =(e^x+\frac{1}{x})\sin{x} + (e^x+\ln{x})(\cos{x}) $$

Problem: $f(x) = \cos{e^{-\sqrt{x}}}$, 求 $f'(1)$

修改形式:

前提:
$x = 1$

证明:
$$ (\cos{e^{-\sqrt{x}}})' = \frac{\sin{\frac{1}{e}}}{2*e} $$

Proof:

$$ (\cos{e^{-\sqrt{x}}})' = -\sin{e^{-\sqrt{x}}}*(e^{-\sqrt{x}}*\frac{1}{-2*\sqrt{x}}) = \frac{\sin{\frac{1}{e}}}{2*e} $$

Problem:
求曲线 $y=\frac{x^{1+x}}{(1+x)^x}$ ($x > 0$) 的斜渐近线方程

修改形式: 

证明:

$$\lim\limits_{x \to \infin} {\frac{y}{x}} = e^{-1}$$
且
$$\lim\limits_{x \to \infin} {(y - e^{-1} * x)} = \frac{1}{2} * e^{-1}$$

Proof:

$$\lim\limits_{x \to \infin} {\frac{y}{x}} = \lim\limits_{x \to \infin} {\frac{\frac{x^{1+x}}{(1+x)^x}}{x}} = \lim\limits_{x \to \infin} {\frac{x^{x}}{(1+x)^x}} = \lim\limits_{x \to \infin} {\frac{1}{(\frac{1}{x}+1)^x}} = \lim\limits_{x \to \infin} {\frac{1}{e^{\ln{(\frac{1}{x} + 1)} * x}}} = \lim\limits_{x \to \infin} {\frac{1}{e^{\frac{1}{x} * x}}} = e^{-1} $$

$$\lim\limits_{x \to \infin} {(\frac{x^{1+x}}{(1+x)^x} - e^{-1} * x)} = \frac{1}{e} * \lim\limits_{x \to \infin} {(x * (e * \frac{x^{x}}{(1+x)^x} - 1))} = \frac{1}{e} * \lim\limits_{x \to \infin} {(x * (e^{1 + \ln{(\frac{x^{x}}{(1+x)^{x}})}} - 1))} = \frac{1}{e} * \lim\limits_{x \to \infin} {(x * (e^{\ln{(e * \frac{x^{x}}{(1+x)^{x}})}} - 1))} = \frac{1}{e} * \lim\limits_{x \to \infin} {(x * (\ln{(e * \frac{x^{x}}{(1+x)^{x}})}))} = \frac{1}{e} * \lim\limits_{x \to \infin} {(x * (1 + x * \ln(\frac{x}{1+x})))} = \frac{1}{e} * \lim\limits_{t \to 0^{+}} {(\frac{1}{t} * (1 + \frac{1}{t} * \ln(\frac{\frac{1}{t}}{1+\frac{1}{t}})))} = \frac{1}{e} * \lim\limits_{t \to 0^{+}} {(\frac{1}{t} * (1 + \frac{1}{t} * \ln(\frac{1}{t + 1})))} = \frac{1}{e} * \lim\limits_{t \to 0^{+}} {\frac{t - \ln{(1+t)}}{t^2}} = \frac{1}{e} * \lim\limits_{t \to 0^{+}} {\frac{1 - \frac{1}{1+t}}{2 * t}} = \frac{1}{e} * \lim\limits_{t \to 0^{+}} {\frac{\frac{1}{(1+t)^2}}{2}} = \frac{1}{2} * e^{-1}$$


Problem:证明:
$$\lim\limits_{x \to 0} {(\frac{1}{e^x - 1} - \frac{1}{\ln{(1+x)}})} = -1$$

Proof:
$$\lim\limits_{x \to 0} {(\frac{1}{e^x - 1} - \frac{1}{\ln{(1+x)}})} = \lim\limits_{x \to 0} {(\frac{\ln{(1+x)} - e^x + 1}{(e^x - 1) * \ln{(1+x)}})} = \lim\limits_{x \to 0} {(\frac{\ln{(1+x)} - e^x + 1}{x^2})} = \lim\limits_{x \to 0} {(\frac{\frac{1}{1+x} - e^x}{2*x})} = \lim\limits_{x \to 0} {(\frac{-\frac{1}{(1+x)^2} - e^x}{2})} = -1$$

Problem: 设函数
$$f(x)=\frac{\sin{x}}{1 + x ^ 2}$$
在 $x=0$ 处的三次泰勒多项式为$a*x+b*x^2+c*x^3$，证明
$$a=1, b=0, c=-\frac{7}{6}$$

Proof1:
$$f(x) = \frac{\sin{x}}{1 + x ^ 2} = (x - \frac{x^3}{6} + o(x^3)) * (1-x^2+o(x^3)) = x - \frac{7}{6}x^3 + o(x^3)$$
因此
$$a=1, b=0, c=-\frac{7}{6}$$

Proof2:
$$f(x)=\frac{\sin{x}}{1 + x ^ 2}=f(0) + f'(0)*x + \frac{f''(0)}{2}*x^2 + \frac{f'''(0)}{6}*x^3 + o(x^3) = x - \frac{7}{6}x^3 + o(x^3)$$
故
$$x - \frac{7}{6}x^3 + o(x^3) = a*x+b*x^2+c*x^3 + o(x^3)$$
因此
$$a=1, b=0, c=-\frac{7}{6}$$

Problem: 用极限的定义证明
$$f(x)=\frac{x^2+4}{5x-2}$$
在$x_0=2$处连续。

修改形式:

已知:

Proof: 暂略。

Problem: $f(x) = \frac{x^2 - 11 * x + 28}{x ^ 2 - 25}$, 研究函数 $f$ 在 $+\infin$ 与 $5$ 处的极限

修改形式: 证明 $\lim\limits_{x \to +\infin} {\frac{x^2 - 11 * x + 28}{x ^ 2 - 25}}=1$, $\lim\limits_{x \to 5^{+}} {\frac{x^2 - 11 * x + 28}{x ^ 2 - 25}} = -\infin$ 与 $\lim\limits_{x \to 5^{-}} {\frac{x^2 - 11 * x + 28}{x ^ 2 - 25}} = +\infin$

Proof:
$$\lim\limits_{x \to +\infin} {\frac{x^2 - 11 * x + 28}{x ^ 2 - 25}}=\lim\limits_{x \to +\infin} {\frac{1 - \frac{11}{x} + \frac{28}{x^2}}{1 - \frac{25}{x^2}}} = 1$$

因为
$$\lim\limits_{x \to 5} {(x^2 - 11 * x + 28)} = -2$$
$$\lim\limits_{x \to 5^{+}} {(x ^ 2 - 25)} = 0^{+}$$
$$\lim\limits_{x \to 5^{-}} {(x ^ 2 - 25)} = 0^{-}$$

所以
$$\lim\limits_{x \to 5^{+}} {\frac{x^2 - 11 * x + 28}{x ^ 2 - 25}} = \frac{\lim\limits_{x \to 5^{+}} {(x^2 - 11 * x + 28)}}{\lim\limits_{x \to 5^{+}} {(x ^ 2 - 25)}} = \frac{-2}{0^{+}} = -\infin$$

$$\lim\limits_{x \to 5^{-}} {\frac{x^2 - 11 * x + 28}{x ^ 2 - 25}} = \frac{\lim\limits_{x \to 5^{-}} {(x^2 - 11 * x + 28)}}{\lim\limits_{x \to 5^{-}} {(x ^ 2 - 25)}} = \frac{-2}{0^{-}} = \infin$$

Problem: $f(x) = \sqrt{\frac{4 * x + 1}{x}}$, 研究函数 $f$ 在 $+\infin$ 与 $0$ 处的极限

修改形式: 证明 $\lim\limits_{x \to +\infin} {\sqrt{\frac{4 * x + 1}{x}}}=1$, $\lim\limits_{x \to 0} {\sqrt{\frac{4 * x + 1}{x}}} = -\infin$

Proof:
$$\lim\limits_{x \to +\infin} {\sqrt{\frac{4 * x + 1}{x}}} = \lim\limits_{x \to +\infin} {\sqrt{4 + \frac{1}{x}}} = \sqrt{4} = 2$$

因为
$$\lim\limits_{x \to 0} {(\frac{4 * x + 1}{x})} = \lim\limits_{x \to 0} {(4 + \frac{1}{x})} = +\infin$$

所以
$$\lim\limits_{x \to 0} {\sqrt{\frac{4 * x + 1}{x}}} = \sqrt{\lim\limits_{x \to 0} {(\frac{4 * x + 1}{x})}} = +\infin$$

Problem: $f(x) = \frac{x+\cos{(x)}}{x+\sin{(x)}}$, 研究函数 $f$ 在 $+\infin$ 处的极限

修改形式: 证明 $\lim\limits_{x \to +\infin} {\frac{x+\cos{(x)}}{x+\sin{(x)}}} = 1$

Proof:
对于足够大的 x ,我们有
$$-\frac{1}{x} \le \frac{\cos{(x)}}{x}  \le \frac{1}{x}$$

因为
$$\lim\limits_{x \to +\infin} {\frac{1}{x}} = 0$$

$$\lim\limits_{x \to +\infin} {-\frac{1}{x}} = 0$$

根据夹逼准则
$$\lim\limits_{x \to +\infin} {\frac{\cos{(x)}}{x}} = 0$$

同理，
$$\lim\limits_{x \to +\infin} {\frac{\sin{(x)}}{x}} = 0$$

因此
$$\lim\limits_{x \to +\infin} {\frac{x+\cos{(x)}}{x+\sin{(x)}}} = \lim\limits_{x \to +\infin} {\frac{1+\frac{\cos{(x)}}{x}}{1+\frac{\sin{(x)}}{x}}} = \frac{\lim\limits_{x \to +\infin} {(1+\frac{\cos{(x)}}{x})}}{\lim\limits_{x \to +\infin} {(1+\frac{\sin{(x)}}{x})}} = \frac{\lim\limits_{x \to +\infin}{1} + \lim\limits_{x \to +\infin} {\frac{\cos{(x)}}{x}}}{\lim\limits_{x \to +\infin}{1} + \lim\limits_{x \to +\infin} {\frac{\sin{(x)}}{x}}} = \frac{1 + 0}{1 + 0} = 1$$
