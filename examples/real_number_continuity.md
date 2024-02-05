确界原理证明单调有界原理

证明：设 $a_n$ 为有上界的单调递增序列 (PrAction ASuppose)

由确界原理， $a_n$ 有上确界 (PrPoseWithoutProof FTheorem)

记为 $A=\sup{a_n}$ (PrAction ASet)

下面证明：$\lim\limits_{n \to +\infty}{a_n}=A$ (PrPoseAndProve FNoHint)

{ (PrPoseAndProof FNoHint)

取 $\epsilon>0$ (PrAction AIntros)

根据上确界的定义，$\{a_n\}$ 中存在一个元素 $a_N$，满足 $a_N > A - \epsilon$ (PrPoseWithoutProof FDefinition)

因为 $a_n$ 单调递增，所以对于任意的 $n > N$，有 $a_n > a_N$ (PrPoseWithoutProof FCausalInfer)

因此，对于任意的 $n>N$，$a_n > a_N>A - \epsilon$ (PrPoseWithoutProof FNoHint)

因为 $A$ 是 $\{a_n\}$ 的一个上界，所以对于任意的正整数 $n$，有 $a_n<A$ (PrPoseWithoutProof FCausalInfer)

因此，对于任意的 $n>N$，有 $A-\epsilon<a_n<A+\epsilon$ (PrPoseWithoutProof FNoHint)

根据极限的定义，我们有 $\lim\limits_{n \to +\infty}{a_n}=A$ (PrPoseWithoutProof FDefinition)

}

综上可知，原命题得证。 (PrConclWithoutProof FNoHint) (如果没有怎么办)

同理可证，有下界的单调递减数列必有极限，且其极限即为它的下确界。

确界原理证明闭区间套定理

证明：设 $\{[a_n, b_n]\}$ 是一个闭区间套，取集合 $S=\{a_n\}$

由于任意 $b_n$ 都是集合 $S=\{a_n\}$ 的上界，根据确界原理，集合 $S=\{a_n\}$ 存在上确界，记为 $\xi=\sup{S}$

下面证明 $\xi$ 属于每一个闭区间 $[a_n, b_n]$

显然 $a_n<\xi (n=1,2,3,...)$，因此我们只需证明对于任意正整数 $n$，都有 $\xi \le b_n$

因为对于任意正整数 $n$，$b_n$ 都是 $S$ 的一个上界，根据上确界的定义，我们有 $\xi \le b_n$

所以存在实数 $\xi$，使得 $\xi \in [a_n, b_n] (n=1,2,3,...)$

下面证明 $\xi$ 的唯一性，假设还有另外一个实数 $\xi'$，也满足 $\xi' \in [a_n, b_n] (n=1,2,3,...)$

那么对于任意正整数 $n$，我们都有 $|\xi - \xi'| \lt b_n - a_n$

两边同时取极限，我们有 $|\xi - \xi'| \le \lim\limits_{n \to +\infty}{(b_n - a_n)} = 0$

因此，$|\xi - \xi'| = 0$，$\xi$ 是唯一的