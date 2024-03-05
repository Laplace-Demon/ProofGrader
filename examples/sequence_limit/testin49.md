要证：

对于任意 $\{ a_n, n \in N \}$，对于任意 $\{ b_n, n \in N \}$，对于任意 $\{ c_n, n \in N \}$，对于任意 $l$，若对于任意$n$，$a_n \le b_n \le c_n$，则若$\lim\limits_{n \to +\infty}{a_n} = l$，则若$\lim\limits_{n \to +\infty}{c_n} = l$，则 $\lim\limits_{n \to +\infty}{b_n} = l$

证明：

假设对于任意$n$，$a_n \le b_n \le c_n$,

假设$\lim\limits_{n \to +\infty}{a_n} = l$,

假设$\lim\limits_{n \to +\infty}{c_n} = l$,

取 $\epsilon$，$\epsilon > 0$

{

根据极限的定义，$存在Na$ 满足 对于任意$n$，若$n \ge Na$，则$|a_n - l| < \epsilon$,

根据极限的定义，$存在Nc$ 满足 对于任意$n$，若$n \ge Nc$，则$|c_n - l| < \epsilon$,

因此，对于任意$n$，若$n \ge \max(Na, Nc)$，则 $l - \epsilon < a_n \le b_n \le c_n < l + \epsilon$,

因此，对于任意$n$，若$n \ge \max(Na, Nc)$，则 $l - \epsilon < b_n < l + \epsilon$,

因此，对于任意$n$，若$n \ge \max(Na, Nc)$，则 $|b_n - l| < \epsilon$

}

根据极限定义可得，$\lim\limits_{n \to +\infty}{b_n} = l$,

综上可知，原命题得证。