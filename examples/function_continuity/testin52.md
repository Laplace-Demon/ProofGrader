已知：
$\varepsilon >0$ 
$\delta >0$
$x_1 \ge 0$   
$x_2 \ge 0$   
$|x_1-x_2| \le \delta$   
$\delta = \min(\frac{\varepsilon^{2}}{2}, \frac{\pi^{2}}{2})$
$x_1 \ge x_2$

要证：
$$|\cos{\sqrt{2*x_1}}-\cos{\sqrt{2*x_2}}| \le \varepsilon$$

证:

易知：
$$x_1 - x_2 \ge 0$$
,
易知：
$$x_1 - x_2 = |x_1 - x_2| \le \delta$$
,
易知：
$$0 \le \frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}$$
,
易知：
$$\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2} \le \frac{\sqrt{2*x_2 + 2*\delta} - \sqrt{2*x_2}}{2} = \frac{\delta}{\sqrt{2*x_2 + 2*\delta} + \sqrt{2*x_2}} \le \sqrt{\frac{\delta}{2}} \le \frac{\pi}{2}$$
,
易知：
$$\sqrt{\frac{\delta}{2}} \le \frac{\pi}{2}$$
,
易知：
$$\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2} \le \frac{\sqrt{2*x_2 + 2*\delta} - \sqrt{2*x_2}}{2} = \frac{\delta}{\sqrt{2*x_2 + 2*\delta} + \sqrt{2*x_2}} \le \sqrt{\frac{\delta}{2}}$$
,
自然可知：
$$0 \le \sin{\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}} \le \sin{\sqrt{\frac{\delta}{2}}} \le \sqrt{\frac{\delta}{2}} \le \frac{\varepsilon}{2}$$
,
自然：
$$|\sin{\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}}| \le \frac{\varepsilon}{2}$$
,
易知：
$$|\cos{\sqrt{2*x_1}} - \cos{\sqrt{2*x_2}}| = |(-2 * \sin{\frac{\sqrt{2*x_1} + \sqrt{2*x_2}}{2}} * \sin{\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}})| = |2 * \sin{\frac{\sqrt{2*x_1} + \sqrt{2*x_2}}{2}} * \sin{\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}}| = 2 * |\sin{\frac{\sqrt{2*x_1} + \sqrt{2*x_2}}{2}}| * |\sin{\frac{\sqrt{2*x_1} - \sqrt{2*x_2}}{2}}| \le \varepsilon$$
,

综上可知，原命题得证。
