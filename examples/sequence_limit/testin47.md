要证：

对于任意 $\{ a_n, n \in N \}$，若 $\{ a_n, n \in N \}$ 收敛，则 $\lim\limits_{n \to +\infty}{a_n}$ 唯一

证明：

假设 $\{ a_n, n \in N \}$ 收敛,

根据收敛的定义，$存在l$ 满足 $\lim\limits_{n \to +\infty}{a_n} = la$,

取 $lb$，$lb = \lim\limits_{n \to +\infty}{a_n}$

{

取 $\epsilon$，$\epsilon > 0$

{

根据极限的定义，$存在Na$ 满足 对于任意$n$，若$n \ge Na$，则$|a_n - la| < \frac{\epsilon}{2}$,

根据极限的定义，$存在Nb$ 满足 对于任意$n$，若$n \ge Nb$，则$|a_n - lb| < \frac{\epsilon}{2}$,

因此，对于任意$n$，若$n \ge \max(Na, Nb)$，则 $|la - lb| = |(la - a_n) + (a_n - lb)| \le |la - a_n| + |a_n - lb| < \frac{\epsilon}{2} + \frac{\epsilon}{2} = \epsilon$

}

因此，对于任意$\epsilon$，若$\epsilon > 0$，则$|la - lb| < \epsilon$,

因此，$la = lb$

}

根据唯一性的定义， $\lim\limits_{n \to +\infty}{a_n}$ 是唯一的,

综上可知，原命题得证。