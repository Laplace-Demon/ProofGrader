Problem: 
$$\lim\limits_{x \to 0}\frac{\sqrt[3]{x+1}-1}{\sqrt{x+1}-1} = \frac{2}{3}$$

Solution:  
$$\lim\limits_{x \to 0}\frac{\sqrt[3]{x+1}-1}{\sqrt{x+1}-1} = \lim\limits_{x \to 0}(\frac{x}{(\sqrt[3]{x+1})^2 + \sqrt[3]{x+1} + 1} \cdot \frac{\sqrt{x+1}+1}{x}) = \frac{2}{3}$$
.

Problem: 已知 
$$\lim\limits_{x \to 1}\frac{x^2 +ax + b}{x^2 - x} = 4$$
，求a, b。

Solution: 
$$4 = \lim\limits_{x \to 1}\frac{x^2 +ax + b}{x^2 - x} = \lim\limits_{u \to 0}\frac{(1+u)^2 +a(1+u) + b}{(1+u)^2 - (1+u)} = \lim\limits_{u \to 0}\frac{u^2 + (a+2)u + (1+a+b)}{u^2+u}$$
.

故，1+a+b=0，并且 a+2=4。因此，a = 2, b = -3。

Problem: 求
$$f(x)=(e^x+\ln{x})\sin{x}$$
 的一阶导数。

Solution: 
$$f'(x) = (e^x+\ln{x})'\sin{x} + (e^x+\ln{x})(\sin{x})' =(e^x+\frac{1}{x})\sin{x} + (e^x+\ln{x})(\cos{x}) $$
.

Problem: 讨论
$$f(x)=\frac{e^x-1}{x(x-2)}$$
的间断点类型。

Solution: 
$$f(x)$$
在$x\neq 0$且
$$x\neq 2$$
处显然连续。

当$x=0$，$f(x)$无定义。而$\lim\limits_{x\to 0}f(x) = \lim\limits_{x\to 0}\frac{e^x}{2x - 2}=-\frac{1}{2}$。因此0是$f(x)$的第一类间断点、可去间断点。

当$x=2$，$f(x)$无定义。而$f(x)$在$x=2$处发散。因此2是$f(x)$的第二类间断点、发散间断点。

Problem: 讨论 $f(x) = \lim\limits_{x\to 0} \sin{\frac{1}{x}}$是否存在。

Solution: 不存在。令$\varepsilon = 1$ ，只需证明：对于任意$\delta > 0$，都存在$-\delta < x_1, x_2 < \delta$使得$|f(x_1)-f(x_2)| > \varepsilon$. 这是显然的，只需令 $x_1 = \frac{1}{(2[\frac{1}{\delta\pi }] + 1))\pi }$，$x_2 = - \frac{1}{(2[\frac{1}{\delta\pi }] + 1))\pi }$，则$f(x_1) = 1$, $f(x_2) = -1$，$|f(x_1)-f(x_2)| > \varepsilon$。

Problem：用极限的定义证明
$$f(x)=\frac{x^2+4}{5x-2}$$
在$x_0=2$处连续。

Proof: 暂略。

Problem：证明
$$f(x)=\cos{\sqrt{2x}}$$
在$[0,+\infty)$一致连续。

简化版本：

Problem：证明
$$f(x)=\cos{\sqrt{2x}}$$
对于任意$\varepsilon>0$，存在$\delta>0$，对于任意$x_1, x_2 \in [0, +\infty)$ 且$|x_1 - x_2| \le \delta$, $|f(x_1)-f(x_2)| \le \varepsilon$

Proof: 对于任意$\varepsilon \gt 0$, 取$\delta = \min(\frac{\varepsilon^2}{2}, \frac{\pi^2}{2})$, $x_1, x_2 \in [0, +\infty)$ 且$|x_1 - x_2| \le \delta$，不妨假设 $x_1 \ge x_2$。
  
那么则有：
$0 \le \frac{\sqrt{2x_1} - \sqrt{2x_2}}{2} \le \frac{\sqrt{2x_2 + 2\delta} - \sqrt{2x_2}}{2} = \frac{\delta}{\sqrt{2x_2 + 2\delta} + \sqrt{2x_2}} \le \sqrt{\frac{\delta}{2}} \le \frac{\pi}{2}$
  
因此 $0 \le \sin{\frac{\sqrt{2x_1} - \sqrt{2x_2}}{2}} \le \sin{\sqrt{\frac{\delta}{2}}} \le \sqrt{\frac{\delta}{2}} \le \frac{\varepsilon}{2}$, 即 $|\sin{\frac{\sqrt{2x_1} - \sqrt{2x_2}}{2}}| \le \frac{\varepsilon}{2}$

所以 $|f(x_1)-f(x_2)| = |\cos{\sqrt{2x_1}} - \cos{\sqrt{2x_2}}| = |2 \sin{\frac{\sqrt{2x_1} + \sqrt{2x_2}}{2}} \cdot \sin{\frac{\sqrt{2x_1} - \sqrt{2x_2}}{2}}| = 2|\sin{\frac{\sqrt{2x_1} + \sqrt{2x_2}}{2}}| \cdot |\sin{\frac{\sqrt{2x_1} - \sqrt{2x_2}}{2}}| \le \varepsilon$。

Problem：设函数$f(x)$在$[a,b]$上可导，证明：存在$\xi \in (a,b)$使得$2\xi \cdot (f(b)-f(a)) = (b^2 - a^2)f'(\xi)$。

Wrong Proof. 令 $g(x) = f(\sqrt{x})$ 。对$g$使用拉格朗日中值定理。

Proof:

分类讨论。

如果$a^2 = b^2$，那么必定$a < 0$， $b > 0$，令$\xi  =0$即可

如果$a^2 \neq b^2$，那么令$H(u) = u^2$，$g(u) = f(u) - \frac{f(b)-f(a)}{H(b)-H(a)} \cdot (H(u)-H(a))$。

那么$g'(u) = f'(u) -\frac{f(b)-f(a)}{H(b)-H(a)} \cdot H'(u)$, $g(a) = f(a)$,$g(b)= f(a)$。由罗尔定理，可以找到一个$\xi \in (a,b)$使得 $g'(\xi) = 0$。这意味着：
$$f'(\xi) = \frac{f(b)-f(a)}{H(b)-H(a)} \cdot H'(\xi) $$
，即$2\xi \cdot (f(b)-f(a)) = (b^2 - a^2)f'(\xi)$。

Problem: 求不定积分 $\int\frac{dx}{\sqrt{2-3x^2}}$

Problem: 求不定积分 $\int\sin{x}^4dx$

Problem: 求不定积分 $\int\sqrt{x}(\ln{x})^2dx$

Problem: 求不定积分 $\int\frac{2x+3}{(x-2)(x+5)}dx$

Problem: 求导数 $f(x) = \frac{\ln{x}}{x^2}$

Problem: 求导数 $f(x) = \sqrt{\frac{(x^2+1)(x^2+2)}{(x^4+1)(x^4+2)}}$

Problem: 求导数 $f(x) = (x^2+1)^{\sin{x}}$

Problem: 已知 $f'(x_0) = 2$，求$\lim\limits_{h \to 0}\frac{f(x_0-2h)}{h}$

