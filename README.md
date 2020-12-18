# Points-Gained-NFL
Utilized Markov Decision Process theory to model the game of football and develop a new evaluation metric, Points Gained

Abstract:

To develop a novel approach for performance assessment, this paper revisits the problem of computing value
functions in professional American football, first considered in Carter and Machol's 1971 Operations Research
paper "Operations Research on Football." We provide the first theoretical justification for using a dynamic
programming approach to estimating value functions in sports by formulating the problem as a Markov
chain for two asymmetric teams. We show that the Bellman equation has a unique solution equal to the
bias of the underlying infinite horizon Markov reward process. This result provides, for the first time in the
sports analytics literature, a precise interpretation of the value function: it is the expected number of points
gained or lost over and above the steady state points gained or lost. We derive a martingale representation
for the value function that provides justification, in addition to the analysis of our empirical transition
probabilities, for using an infinite horizon approximation of a finite horizon game. Using over 160,000 plays
from the 2013-2016 National Football League seasons, we derive an empirical value function that forms
our "points gained" performance assessment metric, which quanties the value created or destroyed on any
play relative to expected performance. We show how this metric provides new insight into factors that
distinguish performance. For example, passing plays generate the most points gained, while running plays
tend to generate negative value. Short passes account for the majority of the top teams' success and the
worst teams' poor performance. Other insights include how teams differ by down, quarter, and field position.
The paper concludes with a case study of the 2019 Super Bowl and suggests how the key concepts might
apply outside of sports.

Paper Information:

T. C. Y. Chan, C. Fernandes, M. L. Puterman, "Points gained in football: Using Markov process-based value functions to assess team performance," Operations Research. Forthcoming.
