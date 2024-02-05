Goal:
证明函数 $f(x)=\cos{\sqrt{2*x}}$ 在区间$[0, +\infty[上$一致连续

证:

使用一致连续定义证明。

取$\varepsilon$，
suppose $\varepsilon \gt 0$，

令$\delta = \min(\frac{\varepsilon^{2}}{2}, \frac{\pi^{2}}{2})$

取$x_1$,

取$x_2$,

suppose $x_1 \ge 0$,

suppose $x_2 \ge 0$,

suppose $|x_1-x_2| \le \delta$,

suppose $x_1 \ge x_2$,

易知：
$$x_1 - x_2 \ge 0$$
易知：
$$x_1 - x_2 = |x_1 - x_2| \le \delta$$
易知：
$$0 \le \frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}$$
易知：
$$\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2} \le \frac{\sqrt{2*x_2 + 2*\delta} - \sqrt{2*x_2}}{2} = \frac{\delta}{\sqrt{2*x_2 + 2*\delta} + \sqrt{2*x_2}} \le \sqrt{\frac{\delta}{2}} \le \frac{\pi}{2}$$
易知：
$$\sqrt{\frac{\delta}{2}} \le \frac{\pi}{2}$$
易知：
$$\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2} \le \frac{\sqrt{2*x_2 + 2*\delta} - \sqrt{2*x_2}}{2} = \frac{\delta}{\sqrt{2*x_2 + 2*\delta} + \sqrt{2*x_2}} \le \sqrt{\frac{\delta}{2}}$$
自然可知：
$$0 \le \sin{\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}} \le \sin{\sqrt{\frac{\delta}{2}}} \le \sqrt{\frac{\delta}{2}} \le \frac{\varepsilon}{2}$$
自然：
$$|\sin{\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}}| \le \frac{\varepsilon}{2}$$
易知：
$$|\cos{\sqrt{2*x_1}} - \cos{\sqrt{2*x_2}}| = |(-2 * \sin{\frac{\sqrt{2*x_1} + \sqrt{2*x_2}}{2}} * \sin{\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}})| = |2 * \sin{\frac{\sqrt{2*x_1} + \sqrt{2*x_2}}{2}} * \sin{\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}}| = 2 * |\sin{\frac{\sqrt{2*x_1} + \sqrt{2*x_2}}{2}}| * |\sin{\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}}| \le \varepsilon$$


综上可知，原命题得证。
