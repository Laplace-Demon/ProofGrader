要证：
任意 $\{ a_n, n \in N \}$，任意 $\{ b_n, n \in N \}$，若 $\{ a_n, n \in N \}$ 收敛，则若 $\{ b_n, n \in N \}$ 收敛，则 $\lim\limits_{n \to +\infty}{a_n} + \lim\limits_{n \to +\infty}{b_n}= \lim\limits_{n \to +\infty}{a_n + b_n}$

证明：

假设 $\{ a_n, n \in N \}$ 收敛,

假设 $\{ b_n, n \in N \}$ 收敛,

根据收敛的定义，$存在la$ 满足 $\lim\limits_{n \to +\infty}{a_n} = la$,

根据收敛的定义，$存在lb$ 满足 $\lim\limits_{n \to +\infty}{b_n} = lb$,

取 $ \epsilon $，$\epsilon>0$

{

根据极限的定义，$存在Na$ 满足 对于任意$n$，若$n \ge Na$，则$|a_n - la| < \frac{\epsilon}{2}$,

根据极限的定义，$存在Nb$ 满足 对于任意$n$，若$n \ge Nb$，则$|b_n - lb| < \frac{\epsilon}{2}$,

因此，对于任意$n$，若$n \ge \max(Na, Nb)$，则 $|(a_n + b_n) - (la + lb)| = |(a_n - la) + (b_n - lb)| \le |a_n - la| + |b_n - lb| < \frac{\epsilon}{2} + \frac{\epsilon}{2} = \epsilon$

}

根据极限定义可得，$\lim\limits_{n \to +\infty}{a_n + b_n} = la + lb$,

因此，$\lim\limits_{n \to +\infty}{a_n + b_n} = \lim\limits_{n \to +\infty}{a_n} + \lim\limits_{n \to +\infty}{b_n}$,

综上可知，原命题得证。