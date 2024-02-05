(Cauchy 收敛准则) ： 基本数列一定收敛

$\forall \{a_n\}$,   若 $\{a_n\}$ 为 Cauchy 列 , 则存在$A$ ，$\lim\limits_{n \to +\infty}{a_n}=A$

证：

假设$\{a_n\}$是Cauchy列，

由Cauchy列的性质,  可知$\{a_n\}$有界

由Bolzano-Weierstrass定理,  可知$\{a_n\}$有收敛子列。

记$\{a_{n_k}\}$ 为$\{a_n\}$ 的收敛子列，

令 A = $\lim\limits_{k \to +\infty}{a_{n_k}}$

取$\epsilon > 0$

{

由$\{a_n \}$ 是Cauchy列，可知: 存在N，对任意n, m > N，$|a_n - a_m| < \frac{\epsilon}{2}$

易知$\forall k, n_k >= k$

若$k > N$ 则$n_k > N$

取$n > N, k > N$

{

由Cauchy定义可知， $|a_n - a_{n_k}| < \frac{\epsilon}{2}$

两边对k取极限，可知： $|a_n - A| <= \frac{\epsilon}{2} < \epsilon$

}

}

根据极限定义，$\lim\limits_{n \to +\infty}{a_n}=A$

综上可知原命题得证