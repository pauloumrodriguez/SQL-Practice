# Coin Fairness Test

Let \(X\) be the number of heads in 10 flips. Under a fair coin,
\(X \sim \operatorname{Binomial}(10, 0.5)\).

- Null hypothesis: \(H_0: p = 0.5\)
- Alternative hypothesis: \(H_1: p \ne 0.5\)

For the observed result of one head, the lower-tail probability is:

\[
P(X \le 1 \mid H_0)
= \frac{\binom{10}{0} + \binom{10}{1}}{2^{10}}
= \frac{11}{1024}
\approx 0.0107
\]

Because this is a two-sided test, the exact p-value is:

\[
2 \times P(X \le 1 \mid H_0)
= \frac{22}{1024}
\approx 0.0215
\]

Since \(0.0215 < 0.05\), we reject the null hypothesis at the 5% significance
level. The result provides evidence that the coin is biased, specifically toward
tails.

If the alternative had been specified in advance as one-sided
(`H1: p < 0.5`), the p-value would instead be approximately `0.0107`.
