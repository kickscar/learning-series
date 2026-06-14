# ML from NumPy Scratch

> 회귀에서 ML 시스템 통합까지, 수식 유도와 NumPy 구현으로 알고리즘의 작동 원리를 증명하는 13권 시리즈.

**13 시리즈 · 한국어 · 본문 CC BY-SA 4.0 / 코드 MIT**

---

## 무엇인가

**ML from NumPy Scratch**는 컴퓨터과학 학부 과정에서 학생이 *머신러닝 알고리즘의 수학적 작동 원리를 처음부터 끝까지 직접 증명하고 구현할 수 있게* 안내하는 13권의 기술문서 시리즈다.

scikit-learn 사용법이 아니라, 알고리즘이 **왜·어떻게 작동하는가**를 코드 수준에서 증명한다. 산업 도구는 본인 구현이 끝난 후 비교용으로만 도입한다.

---

## 왜 만드는가

기존 시중 ML 자료는 다음 셋 중 하나의 한계를 갖는다.

1. **수학을 회피한다.** "복잡한 수식은 생략한다"는 한 줄로 학생을 막다른 길에 세운다. 정규방정식이 왜 그렇게 생겼는지, Adam의 bias correction이 왜 필요한지를 모르면 응용도 디버깅도 할 수 없다.
2. **도구 사용법에 머문다.** `sklearn.fit()`을 호출하면 답이 나오지만, 그 안에서 무슨 일이 일어나는지 모른다. 도구가 바뀌면 처음부터 다시 배워야 한다.
3. **고전과 현대가 단절돼 있다.** 회귀·정규화 교재와 LLM 시대의 화두(이중 하강, 과매개변수화)가 서로 다른 세계에 있다. 둘이 같은 토대 위에 서 있다는 것을 보여주는 자료가 없다.

이 컬렉션은 셋을 한 번에 해결한다.

- **수학을 회피하지 않는다.** 정규방정식 유도부터 Adam bias correction 증명까지, 모든 수식을 생략 없이 전개한다. 학생이 종이와 펜으로 따라갈 수 있어야 한다.
- **NumPy로 직접 만든 뒤 도구와 비교한다.** 알고리즘을 scratch로 구현하고, sklearn과 결과가 같은지 검증한다. "우리가 만든 것이 진짜 동작한다"를 확인한 뒤에야 산업 도구를 쓴다.
- **고전의 깊이와 현대의 흐름을 동시에 잡는다.** 회귀와 최적화가 LLM의 토대이기도 하다는 것을 자연스럽게 연결한다. 강요하지 않되 빠뜨리지 않는다.

---

## 13 시리즈

| # | 시리즈 | 한 줄 |
|---|--------|------|
| 1 | **Linear Models & Optimization** | 정규방정식에서 Adam까지, 회귀와 최적화의 수학적 토대 |
| 2 | **Classification & Generalization Theory** | 편향-분산에서 이중 하강까지, 분류의 기하학과 일반화 이론 |
| 3 | **Bayesian Inference & MCMC** | 켤레 사전분포에서 깁스 샘플링까지, 확률적 사고의 토대 |
| 4 | **Latent Variables & Dimensionality** | HMM·GMM·EM에서 t-SNE·UMAP까지, 숨겨진 구조의 발견 |
| 5 | **Trees & Ensembles** | 결정 트리에서 XGBoost·SHAP까지, 정형 데이터의 챔피언 |
| 6 | **Time Series & Forecasting** | ARIMA에서 LSTM까지, 시계열 예측의 모든 패러다임 |
| 7 | **Classical Causal Inference** | 잠재적 결과에서 do-calculus까지, 인과추론의 고전 토대 |
| 8 | **Causal Machine Learning** | Double ML·Causal Forest·Uplift, ML과 인과의 만남 |
| 9 | **Foundations of Reinforcement Learning** | MDP에서 Actor-Critic까지, 강화학습의 수학적 기초 |
| 10 | **Model-based RL & Modern Connections** | World Models·MuZero, 그리고 LLM 정렬과의 연결 |
| 11 | **MLOps & Interpretability** | 파이프라인에서 LIME·공정성까지, 연구 코드를 프로덕션으로 |
| 12 | **LLMOps & Integrated Operations** | LLM 운영의 5가지 차별점과 ML·LLM 통합 운영 |
| 13 | **ML Systems Integration** | 12권의 도구를 언제·왜·어떻게 조합하는가, 통합 사고의 방법론 |

> **선수지식** (외부 강의·자기학습 권장): 미적분, 선형대수, 확률통계, 파이썬 기초. CS 학부 1년차 수준 과목으로 충분하다.

---

## 시리즈 의존성

핵심 의존성만 표시. 같은 번호 순서는 암묵적 선후관계.

```
[외부 수학] ──► ① Linear Models & Optimization
                 │
                 ├──► ② Classification & Generalization
                 │
                 ├──► ③ Bayesian Inference & MCMC
                 │       │
                 │       └──► ④ Latent Variables & Dimensionality
                 │
                 ├──► ⑤ Trees & Ensembles
                 │
                 ├──► ⑥ Time Series (← ③ 도 선행)
                 │
                 ├──► ⑦ Classical Causal Inference (← ② 도 선행)
                 │       │
                 │       └──► ⑧ Causal ML (← ③, ⑤ 도 선행)
                 │
                 ├──► ⑨ Foundations of RL (← ③ 도 선행)
                 │       │
                 │       └──► ⑩ Model-based RL
                 │
                 └──► ⑪ MLOps & Interpretability (← 여러 시리즈 경험)
                         │
                         └──► ⑫ LLMOps ──► ⑬ ML Systems Integration
```

- ①이 모든 시리즈의 토대. 반드시 첫 번째로 학습한다.
- ②~⑩은 ①을 마친 후 관심과 일정에 따라 경로를 선택할 수 있다.
- ⑬은 마지막 시리즈. 나머지를 충분히 경험한 뒤에 수강한다.

---

## 작성 원칙

이 컬렉션 전체에 적용되는 불변 원칙. 모든 시리즈는 자신의 `CLAUDE.md`에서 이 원칙을 어떻게 구체화했는지 기록한다.

1. **4단 구조** — 모든 핵심 개념은 *수식 → 직관 → 코드 → 실험* 순서로 다룬다. 한 단계도 생략하지 않는다.
2. **수학을 회피하지 않는다** — 유도 과정을 생략하지 않는다. 학생이 종이와 펜으로 다시 따라갈 수 있어야 한다.
3. **NumPy Scratch 우선** — 모든 알고리즘을 NumPy(+matplotlib)로 직접 구현. sklearn 등 산업 도구는 비교·검증용으로만.
4. **독립 완결성** — 각 시리즈가 그 자체로 완결된 책이다. 다른 시리즈 없이도 해당 영역의 토대를 얻을 수 있다.
5. **"왜"를 먼저 답한다** — 알고리즘을 소개할 때 *어떤 문제를 푸는가*를 먼저 명확히 한다.
6. **한국어 본문 + 영문 용어** — 본문은 한국어, 기술 용어·식별자·코드 주석은 영문 유지.

---

## 누구를 위한 자료인가

- **학부생** — 학기별 순서를 따라 학습. 수학적 토대를 쌓고 싶은 학생에게.
- **다른 전공 자율학습자** — 시리즈를 독립적으로 골라 학습. 의존성 그래프를 참조해 선행 시리즈를 먼저 본다.
- **다른 강사·교수** — 시리즈를 강의 교재로 자유롭게 채택 가능 (본문 CC BY-SA 4.0).
- **현역 엔지니어** — sklearn으로 쓰던 알고리즘을 *수식부터 다시* 정리하고 싶을 때 참고서로.

---

## 도달점

이 컬렉션을 마친 학생의 역량 체크리스트:

- 선형 회귀의 정규방정식을 유도하고, 경사하강법의 수렴 조건을 설명할 수 있다.
- SGD에서 Adam까지 최적화 알고리즘의 진화를 코드로 추적할 수 있다.
- Ridge·Lasso·ElasticNet의 기하학적 의미를 시각화로 보여줄 수 있다.
- 편향-분산 분해, VC 차원, 이중 하강을 수식 수준에서 이해한다.
- 베이즈 추론과 MCMC를 직접 구현하고 사후 분포를 시각화할 수 있다.
- 결정 트리에서 XGBoost까지 부스팅의 수학적 토대를 유도할 수 있다.
- 인과추론의 고전(PSM, DiD, IV)과 현대(DML, Causal Forest)를 모두 구현할 수 있다.
- ML 시스템의 설계 의사결정(모델 선택, 데이터 누수 진단, 모니터링)을 체계적으로 수행할 수 있다.
- "이 알고리즘은 왜 이렇게 생겼는가"라는 질문에 수식과 코드로 답할 수 있다.

---

## 저장소 · 라이선스

- **GitHub**: 본 저장소 — 시리즈별 코드, 챕터·섹션 안내 `README.md`, 본 컬렉션 `README.md`, 시리즈별 작업 가이드 `CLAUDE.md`.
- **Notion**: 본문(이론) 정리본 — 각 시리즈 진행 시 별도 안내.
- **본문 라이선스**: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) — 출처표시 + 동일조건변경허락.
- **코드 라이선스**: [MIT](https://opensource.org/licenses/MIT).

---

## 시리즈 상세

각 시리즈의 개요, 선행·후행 관계를 아래에 정리한다.

---

### Linear Models & Optimization

**Proving the Math of Regression and Optimization with NumPy**

모든 머신러닝의 출발점이자 토대인 선형 모델과 경사 기반 최적화를 NumPy로 직접 구현하면서 그 수학적 작동 원리를 끝까지 파헤치는 책. 최소제곱법의 정규방정식 유도부터 시작해 SGD, Momentum, AdaGrad, RMSProp, Adam까지의 최적화 알고리즘 진화를 코드 수준에서 추적하고, Ridge·Lasso·ElasticNet의 정규화가 가지는 기하학적 의미를 시각화한다. 회귀와 최적화는 모든 후속 알고리즘의 토대가 되므로, 이 책의 깊이가 시리즈 전체의 깊이를 결정한다.

- **선행**: 없음 (시리즈 진입)
- **후행**: ② Classification, ⑤ Trees, ③ Bayesian, ⑨ RL

---

### Classification & Generalization Theory

**Exploring the Geometry of Classification and the Math Behind Generalization**

"왜 모델이 일반화되는가"라는 머신러닝의 가장 본질적인 질문에 수학적으로 답하는 책. 편향-분산 분해의 유도, VC 차원과 PAC 학습 이론, 그리고 LLM 시대의 핵심 화두인 이중 하강(Double Descent) 현상까지 다룬다. 후반부에서는 로지스틱 회귀, Softmax 다중분류, SVM과 커널 트릭으로 분류 알고리즘의 기하학적 토대를 완성한다.

- **선행**: ①
- **후행**: ③ Bayesian, ⑤ Trees, ⑦ Causal

---

### Bayesian Inference & MCMC

**Probabilistic Thinking and Markov Chain Monte Carlo from the Ground Up**

베이즈 추론과 마르코프 연쇄 몬테카를로(MCMC) 방법을 수식 유도와 NumPy 구현을 통해 완전히 이해하는 책. 켤레 사전분포의 수학적 분석에서 시작해, 메트로폴리스-헤이스팅스, 깁스 샘플링까지 모든 MCMC 알고리즘을 직접 구현한다.

- **선행**: ①
- **후행**: ④ Latent Variables, ⑥ Time Series, ⑧ Causal ML

---

### Latent Variables & Dimensionality

**Discovering Hidden Structures with Latent Variable Models and the Geometry of Dimensions**

데이터 안에 숨겨진 보이지 않는 구조를 발견하는 모든 도구를 통합 관점에서 다루는 책. HMM, GMM, EM, 변분 추론에서 PCA, t-SNE, UMAP까지. 잠재변수 모델과 차원축소를 같은 권에서 다루는 것은 둘 다 "관측되지 않은 구조"를 다루는 동일한 사고방식에 뿌리를 두기 때문이다.

- **선행**: ③
- **후행**: ⑥ Time Series, ⑧ Causal ML, ⑬ Integration

---

### Trees & Ensembles

**From Decision Trees to XGBoost, Stacking, and SHAP — The Champion of Tabular Data**

LLM 시대에도 정형 데이터에서 SOTA를 지키는 트리 기반 모델의 모든 것. Shannon Entropy에서 시작해 Random Forest, AdaBoost, Gradient Boosting, XGBoost, CatBoost, Stacking, SHAP까지 부스팅의 진화를 끝까지 추적한다.

- **선행**: ①
- **후행**: ⑥ Time Series, ⑧ Causal ML, ⑪ MLOps

---

### Time Series & Forecasting

**From Statistical Models to LSTM, and Beyond**

시계열 데이터를 다루는 모든 도구를 통계적 토대부터 현대 딥러닝까지 통합한 책. ARIMA, 칼만 필터, VAR, LSTM, Prophet, 이상탐지까지. 통계 모델과 딥러닝 모델의 잔차 보정 하이브리드 아키텍처로 마무리한다.

- **선행**: ①, ③
- **후행**: ⑪ MLOps, ⑬ Integration

---

### Classical Causal Inference

**From Correlation to Causation — From Potential Outcomes to do-calculus**

"원인과 결과"를 데이터로 증명하는 인과추론의 고전적 토대. 잠재적 결과, DAG, PSM, IPW, DiD, IV, RDD, Synthetic Control, do-calculus까지 다룬다.

- **선행**: ①, ②
- **후행**: ⑧ Causal ML, ⑪ MLOps, ⑬ Integration

---

### Causal Machine Learning

**A Modern Synthesis of Double ML, Causal Forest, Uplift, and Bayesian Causal Inference**

머신러닝과 인과추론이 만나는 현대적 영역의 결정판. Double ML, Causal Forest, Uplift Modeling, 베이지안 구조 방정식 모델까지.

- **선행**: ⑦, ⑤, ③
- **후행**: ⑪ MLOps, ⑬ Integration

---

### Foundations of Reinforcement Learning

**The Mathematical Foundations of MDP, Bellman Equations, Q-learning, and Policy Gradient**

강화학습의 고전적 토대를 신경망 없이 수식과 코드로 끝까지 파는 책. MAB에서 Actor-Critic, Reward Shaping까지.

- **선행**: ①, ③
- **후행**: ⑩ Model-based RL, ⑬ Integration

---

### Model-based RL & Modern Connections

**World Models, MuZero, MCTS, and the Bridge to LLM Alignment**

Model-free RL을 마스터한 후 진입하는 현대 강화학습. Dyna-Q, World Model, MuZero. 마지막 챕터에서 LLM 정렬(RLHF, PPO)과의 연결을 분석한다.

- **선행**: ⑨
- **후행**: ⑬ Integration

---

### MLOps & Interpretability

**From Research Code to Production, From Black Box to White Box**

연구용 ML 코드를 프로덕션으로 만들고, 그 작동 원리를 설명할 수 있게 하는 책. 파이프라인, 드리프트 감지, PDP, LIME, 공정성까지. LLMOps(프롬프트 버전 관리, 환각 탐지, 통합 모니터링)도 포함한다.

- **선행**: 여러 시리즈 경험
- **후행**: ⑫ LLMOps, ⑬ Integration

---

### LLMOps & Integrated Operations

**Five Distinctions of LLM Operations and the Integrated Operation of General ML and LLM**

일반 ML 운영과 LLM 운영의 본질적 차이를 이해하고 통합 운영하는 책.

- **선행**: ⑪
- **후행**: ⑬ Integration

---

### ML Systems Integration

**A Methodology for Integrated Thinking and Decision-Making**

12권의 도구를 언제·왜·어떻게 조합해 쓰는가의 통합 사고를 기르는 책. 새로운 알고리즘이 아니라 통합 사고의 방법론을 다룬다.

- **선행**: 이전 12권 중 다수
- **후행**: 없음 (시리즈 마지막)

---

## 이 컬렉션에서 작업하는 Claude들에게

이 `README.md`는 13 시리즈가 모인 컬렉션의 **변하지 않는 컨텍스트**다.

각 시리즈 디렉토리의 `CLAUDE.md`를 처음 열고 작업을 시작할 때, 본 README를 먼저 읽고 *전체 컬렉션의 정체성·작성 원칙·자신의 시리즈가 어디에 위치하는지*를 확인한다.

시리즈 작업 도중 *전체 컬렉션의 방향이 흔들릴 만한 결정*이 나오면 사용자에게 확인 후 본 README를 갱신한다. 시리즈 내부에서만 유효한 결정은 해당 시리즈의 `CLAUDE.md`에만 기록한다.
