要证：
对于任意数列 $\{ a_n, n \in N \}$，若 $\{ a_n, n \in N \}$有上界，则若 $\{ a_n, n \in N \}$ 单调递增，则 $存在A$ ，$\lim\limits_{n \to +\infty}{a_n}=A$

证： 
假设 $\{ a_n, n \in N \}$ 有上界,

假设 $\{ a_n, n \in N \}$ 单调递增,

由确界原理可得，$存在A$ 满足 $A = \sup{\{ a_n, n \in N \}}$,

下面证明： $\lim\limits_{n \to +\infty}{a_n}=A$

{ 

取 $ \epsilon $，

$\epsilon>0$

{

根据上确界定义可得，$存在N$ ， $a_N > A - \epsilon$,

因为$\{ a_n, n \in N \}$单调递增，所以对于任意$n$，若$n > N$，则$a_n > a_N$,

易知对于任意$n$，若$n > N$，则$a_n>a_N>A-\epsilon$,

因为 $A$ 是 $\{ a_n, n \in N \}$ 的上界，所以对于任意$n$，$a_n<A$,

因此，对于任意$n$，若$n > N$，则 $A-\epsilon<a_n<A+\epsilon$

}

根据极限定义可得，$\lim\limits_{n \to +\infty}{a_n}=A$,

综上可知，原式得证。

}

综上可知，原命题得证。
