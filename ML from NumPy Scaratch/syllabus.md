# 1. Statistical Learning: Regression & Optimization

**01.** 하이퍼플레인과 선형 결합 (Linear Combination & Hyperplane)

**02.** 최소제곱법(OLS) 정규방정식 수식 증명 및 기본 행렬 연산 구현

**03.** 다중공선성 제어와 가중 회귀분석 (Weighted Least Squares) 구현

**04.** 비용 함수 미분과 배치 경사하강법 (Batch Gradient Descent) 소스코드 작성

**05.** 확률적 경사하강법(SGD) 및 미니배치 데이터 셔플링 알고리즘 빌드

**06.** 관성 중심 최적화: Momentum 및 Nesterov Accelerated Gradient 수식 유도

**07.** 적응형 학습률 최적화: AdaGrad 및 RMSProp 알고리즘의 뼈대 자작

**08.** **[중간고사 프로젝트]** NumPy 활용 범용 최적화 엔진 (Optimizer Class) 패키징

**09.** Adam 최적화의 1차/2차 모멘트 편향 수정 (Bias Correction) 수식 증명 및 완전 구현

**10.** Ridge 정규화(L2 Penalty)의 역행렬 안정성 수식 유도 및 기하학적 경계 구현

**11.** Lasso 정규화(L1 Penalty)와 미분 불가능점 극복을 위한 좌표하강법 (Coordinate Descent) 구현

**12.** ElasticNet 혼합 패러다임 조건 수렴성 분석 및 하이퍼파라미터 행렬 튜닝

**13.** 벡터 공간에서의 유사도 메트릭 (Cosine, Jaccard, Mahalanobis) 행렬 최적화

**14. 🆕 편향-분산 분해 (Bias-Variance Decomposition) 수식 유도 및 학습 곡선 시각화 구현**

**15. 🆕 VC 차원·PAC 학습 이론 기초와 일반화 경계 (Generalization Bound) 수학적 분석**

**16. 🆕 이중 하강 (Double Descent) 현상과 과매개변수화 (Over-parameterization) 시대의 일반화 재해석**

**17.** 로지스틱 회귀 + Softmax 다중분류 + Cross-Entropy 손실 함수 미분 통합 구현 *(확장)*

**18. 🆕 분류의 기하학: SVM의 마진 최대화, 커널 트릭 (RBF·Polynomial), Dual Form 유도 및 구현**

**19.** **[기말고사 릴리즈]** Scikit-learn을 대체하는 자작 선형/분류/커널 통합 최적화 프레임워크 최종 제출

---

# 2. Statistical Learning: Probabilistic Models

**01.** 확률 변수, 결합 확률 분포 및 주변화 (Marginalization) 수학적 리비지트

**02.** 베이지안 패러다임과 Conjugate Prior (켤레 사전분포)의 수학적 분석

**03.** 라플라스 스무딩 (Laplace Smoothing)이 포함된 나이브 베이즈 분류기 스크래치 구현

**04.** 그래픽 모델 관점의 베이즈 네트워크 (Bayesian Networks) 조건부 독립성 분해 수식화

**05.** 마르코프 속성과 전이 행렬 (Transition Matrix)의 정상 분포 수렴 조건 증명

**06.** 몬테카를로 적분론과 기각 샘플링 (Rejection Sampling) 알고리즘 코딩

**07.** 메트로폴리스-헤이스팅스 (Metropolis-Hastings) 수용 확률(α) 공식 유도 및 구현

**08.** **[중간고사 프로젝트]** 고차원 사후 확률 분포 추정용 MCMC 시뮬레이터 구축

**09.** 깁스 샘플링 (Gibbs Sampling)을 이용한 다변량 조건부 사후분포 중심 좌표축 샘플러 구현

**10.** 은닉 마르코프 모델 (HMM)의 전방-후방 (Forward-Backward) 확률 연산 아키텍처

**11.** 동적 계획법 (Dynamic Programming) 기반 비터비 (Viterbi) 최적 잠재 경로 추적 구현

**12.** Expectation-Maximization (EM) 기반 HMM 파라미터 최적화 (Baum-Welch 알고리즘) 유도

**13.** 연속 확률 변수의 잠재 군집화를 위한 가우시안 혼합 모델 (GMM)과 EM 알고리즘 완전 구현

**14.** 변분 추론 (Variational Inference) 기초: Evidence Lower Bound (ELBO) 수학적 유도

**15. 🆕 차원의 저주 (Curse of Dimensionality) 수학적 증명 및 고차원 공간의 통계적 특성 분석**

**16. 🆕 분산 최대화 직교 기저 도출을 위한 공분산 행렬 고유값 분해 PCA 알고리즘 NumPy 구현**

**17. 🆕 비선형 매니폴드 대응 Kernel PCA 수식 유도 및 RBF 커널 매니폴드 임베딩 구현**

**18. 🆕 t-SNE 및 UMAP의 KL-Divergence 최소화 매니폴드 학습 수식 유도 및 시각화 시스템 구현**

**19.** **[기말고사 릴리즈]** HMM·MCMC·차원축소가 통합된 확률적 베이지안 추론 엔진 최종 평가

---

# 3. Practical ML: Trees & Ensembles

**01.** Shannon Entropy, Information Gain, Gini Impurity의 수학적 정의 및 비교 연산

**02.** 범주형 분할을 위한 ID3 재귀적 트리 생성 알고리즘 수식 매핑 및 소스코드 구현

**03.** 수치형 분할 CART 알고리즘 및 과적합 방지용 Cost-Complexity Pruning (가지치기) 구현

**04.** 잔차 제곱합(SSR) 최소화 기반 트리 회귀 모델 (Regression Tree) 수식 유도 및 구현

**05.** 부트스트랩 샘플링 (Bootstrap Aggregation)을 통한 분산 감소 효과의 통계적 증명

**06.** 특성 무작위 선택 (Feature Subsampling)이 포함된 랜덤 포레스트 병렬 학습 알고리즘 구현

**07.** Mean Decrease Impurity (MDI) 및 Permutation 중요도 추출 메커니즘 밑바닥 구현

**08.** **[중간고사 프로젝트]** 복수 의사결정나무를 제어하는 트리 앙상블 코어 베이스 클래스 구축

**09.** 에이다부스트 (AdaBoost)의 지수 가중치 업데이트 수식 유도 및 가산 모델 구현

**10.** 손실 함수의 음의 구배 (Negative Gradient)를 잔차로 정의하는 Gradient Boosting 수식 증명

**11.** 임의의 커스텀 손실 함수(MSE, Logloss)에 대응하는 GBM 회귀/분류 엔진 스크래치 코딩

**12.** 테일러 급수 (Taylor Expansion) 2차 미분(Hessian)을 활용한 XGBoost 목적 함수 유도 및 구현

**13.** LightGBM의 Leaf-wise 수직 성장 공식 및 GOSS (Gradient-based One-Side Sampling) 개념 구현

**14. 🆕 CatBoost의 Ordered Boosting과 Target Encoding (목표 인코딩) 수식 유도 및 범주형 변수 처리 구현**

**15. 🆕 Stacking과 Blending 메타학습 아키텍처: Out-of-Fold 예측 생성 및 Meta-Learner 결합 구현**

**16.** 협조적 게임이론의 셰플리 값 (Shapley Value) 기반 정형 데이터 SHAP 기여도 산출 알고리즘

**17.** **[기말고사 릴리즈]** 자작 부스팅 엔진·Stacking·SHAP 모듈을 결합한 정형 데이터 분석 패키지 검증

---

# 4. Practical ML: Time Series & Forecasting

**01.** 가법/승법 모델 기반 시계열 추세(Trend) 및 계절성(Seasonality) 신호 분해 알고리즘

**02.** 자기상관함수(ACF)/편자기상관함수(PACF) 수식 유도 및 정상성 확보를 위한 차분 연산 구현

**03.** AR(p) 모델의 Yule-Walker 방정식 유도 및 파라미터 최소제곱 추정 소스코드 구현

**04.** MA(q) 모델의 반전성 수식 유도 및 ARIMA(p,d,q) 예측 프로세스 완전 통합 코딩

**05.** 관측/상태전이 방정식을 이용한 통계적 시계열 시스템의 상태 공간 모델 (State Space) 행렬화

**06.** 칼만 필터 (Kalman Filter)의 Time Update(예측) 및 Measurement Update(수정) 수식 도출

**07.** 다차원 동적 추적 시스템 구동을 위한 NumPy 기반 Kalman Filter 핵심 클래스 제작

**08.** **[중간고사 프로젝트]** 노이즈가 포함된 ARIMA 데이터 스트림용 실시간 칼만 필터링 엔진 구축

**09.** 시차 백워드 연산자 기반 다변량 자기회귀 (VAR, Vector AutoRegression) 모델의 행렬 수식화

**10.** 시계열 윈도우 슬라이싱 기법 및 시간 펼침 역전파 (BPTT) 알고리즘의 행렬 연산 구조 설계

**11.** LSTM Cell 내부의 Forget, Input, Output 게이트 상태 보존 메커니즘 수식화 및 선형 매핑

**12. 🆕 Facebook Prophet의 가법 회귀 모델 (Trend + Seasonality + Holiday) 분해 구조 및 사후분포 추정 구현**

**13.** 전통 통계 모델과 딥러닝 모델의 잔차 보정형 하이브리드 시계열 예측 아키텍처 설계

**14. 🆕 시계열 이상탐지 (Time Series Anomaly Detection): STL 분해 잔차 기반·Isolation Forest·LSTM Autoencoder 통합 구현**

**15.** 시계열 교차 검증 (Time Series Cross-Validation) 및 MAPE, RMSE 오차 산출 프레임워크 구현

**16.** 시계열 신호 분해를 위한 이산 푸리에 변환 (DFT, Discrete Fourier Transform) 행렬 연산 구현

**17.** **[기말고사 릴리즈]** 통계 + 딥러닝 + 이상탐지가 통합된 종단형 시계열 예측 패키지 완성

---

# 5. Decision Science: Causal Inference

**01.** 잠재적 결과 패러다임 (Potential Outcomes Framework)과 반사실(Counterfactual) 통계적 기원

**02.** 선택 편향 (Selection Bias)과 교란 요인의 수학적 증명 및 무작위 배정(RCT)의 무편향성 유도

**03.** 유향 인과 그래프 (DAG)의 대수학적 성질 및 d-separation 기하학적 차단 규칙성 코딩

**04.** 백도어 기준 (Backdoor Criterion) 만족 통제 변수 자동 선택 및 확률 조정 공식 구현

**05.** 로지스틱 회귀 기반 성향점수 매칭 (Propensity Score Matching) 알고리즘 밑바닥 구현

**06.** 성향점수 역수를 가중치로 취하는 IPW (Inverse Probability Weighting) 인구 집단 행렬 계산

**07.** 평행 추세 가정 (Parallel Trends) 수식 검증 및 이중차분법 (Difference-in-Differences) 회귀 코딩

**08.** **[중간고사 프로젝트]** 비즈니스 거래 데이터 분석을 위한 자작 PSM + DiD 인과 효과 격리 엔진 빌드

**09.** 배제 제약 조건 기반 도구 변수 (Instrumental Variables) 및 2단계 최소제곱법 (2SLS) 구현

**10.** 임계값 근방 로컬 RCT 효과 추정을 위한 회귀 단절 모형 (RDD) 및 커널 회귀 연산 코딩

**11.** 대조군 가중치 선형 결합 구조 최적화를 통한 통제 집단 합성법 (Synthetic Control) 구현

**12.** Judea Pearl의 do-calculus 3대 규칙 정의 및 관측 확률분포로의 대수적 환원 알고리즘

**13.** 실무 A/B 테스트 검력 분석 (Power Analysis) 및 최소 감지 효과 (MDE) 기반 샘플 사이즈 산출 수식화

**14.** Meta-Learner 패러다임 입문: S-Learner·T-Learner·X-Learner 아키텍처 비교 및 구현

**15. 🆕 Double Machine Learning (DML): Chernozhukov의 직교 모멘트 조건, Cross-Fitting 알고리즘 수식 유도 및 구현**

**16. 🆕 Causal Forest (Wager & Athey): Honest Splitting 기반 이질적 처치 효과 (HTE) 추정 알고리즘 스크래치 구현**

**17. 🆕 Uplift Modeling: 마케팅·CRM 산업 표준 Two-Model·Class Transformation 접근법 및 Qini Curve 평가 구현**

**18. 🆕 Bayesian Causal Inference: 베이지안 구조 방정식 모델 (BSEM) 및 사후 인과 효과 분포 추정 구현**

**19.** **[기말고사 릴리즈]** 원시 로그 입력 시 교란 통제·이질적 효과 추정·사후분포 산출 인과 분석 엔진 평가

---

# 6. Decision Science: Reinforcement Learning

**01.** 다중 암드 밴딧 (MAB) 환경 하의 ε-Greedy 및 UCB 알고리즘의 수식적 구현

**02.** 베타 분포 사후 확률 실시간 업데이트 기반 톰슨 샘플링 (Thompson Sampling)의 통계적 구현

**03.** 마르코프 의사결정 과정 (MDP) 환경의 상태, 행동, 보상 행렬 수식화 및 벨만 방정식 유도

**04.** 가치 반복법 (Value Iteration) 알고리즘의 최적 가치 수렴 (Contraction Mapping) 수학적 증명 및 코딩

**05.** Policy Evaluation(평가)과 Improvement(개선) 루프 분리형 정책 반복법 (Policy Iteration) 구현

**06.** 에피소드 기반 가치 추정을 위한 First-visit / Every-visit 몬테카를로 (MC) 제어 알고리즘 코딩

**07.** Temporal Difference 예측 수식 유도 및 TD(0) 기반 시간차 가치 추정 알고리즘 스크래치 구현

**08.** **[중간고사 프로젝트]** 커스텀 그리드월드 (Gridworld) 환경 및 가치반복/TD 에이전트 상호작용 플랫폼 빌드

**09.** On-policy(살사)와 Off-policy(큐러닝) 타깃 수식 분석 및 행동 가치 행렬 (Q-table) 업데이트 구현

**10.** 고차원 공간 제어를 위한 특성 벡터 가중치 선형 결합 기반 Linear Function Approximation Q-learning 구현

**11.** 정책 공간 직접 미분을 위한 Policy Gradient 정리 증명 및 REINFORCE 알고리즘 스크래치 코딩

**12.** 분산 감소 베이스라인이 적용된 상태 가치 크리틱(Critic)과 정책 액터(Actor)의 가중치 연립 업데이트 구현

**13.** 포텐셜 기반 보상 형성 (Potential-based Reward Shaping)의 수학적 안전성 증명 및 셰이핑 함수 구현

**14. 🆕 Model-based RL 입문: Dyna-Q 아키텍처와 학습된 모델을 통한 가상 경험 생성 (Planning) 알고리즘 구현**

**15. 🆕 World Model 패러다임: 환경 동역학 모델링과 잠재 공간 (Latent Space) 시뮬레이션 기반 정책 학습 구현**

**16. 🆕 MuZero 개념 분석: 모델·정책·가치 통합 학습과 MCTS (Monte Carlo Tree Search) 검색 알고리즘 입문 구현**

**17.** 현대 LLM 정렬과의 연결: 인간 선호도 데이터 보상 모델링 및 PPO 목적 함수 클리핑 개념 분석

**18.** **[기말고사 릴리즈]** Model-free·Model-based 양대 패러다임 통합 자작 MDP 솔버 코어 라이브러리 평가

---

# 7. ML in Production: MLOps & Interpretability

### Part A. ML 시스템 토대 및 파이프라인 (1-8주차)

**01.** 오프라인 모델과 실시간 프로덕션 인프라 레이어 간 파이프라인 자동화 성숙도 아키텍처 설계론

**02.** 코드-데이터 리니지(추적성) 보장을 위한 데이터 버전 관리 (DVC) 기본 원리 및 매핑 알고리즘 설계

**03.** 데이터 전처리-학습-평가 단계를 컴포넌트 유향 그래프로 추상화하는 자작 ML Pipeline 클래스 구현

**04.** 모델 성능 저하 이벤트 감지 시 파이프라인을 자동 재구동하는 지속적 훈련 (Continuous Training) 엔진 코딩

**05.** 피처 스토어의 온라인/오프라인 레이어 데이터 동기화 기법 및 Point-in-time Join 논리 아키텍처 설계

**06.** 추론 가속을 위한 가중치 행렬 FP32 → INT8 변환 양자화 (Quantization) 수식 계산 및 가지치기 구현

**07.** 고처리량 서빙을 위한 비동기 마이크로 배치 (Micro-batching) 프로세스 및 추론 큐 (Queue) 스크래치 구현

**08.** **[중간고사 프로젝트]** 연구용 코드를 프로덕션 파이프라인으로 전환하는 자작 Automation Core Framework 빌드

### Part B. 모니터링·드리프트·해석 가능성 (9-13주차)

**09.** 인구통계학적 지표 추적을 위한 쿨백-라이블러 발산 (KL-Divergence) 및 KS-Test 통계량 수식 구현

**10.** 정답 레이블 수집 지연 환경 대응을 위한 모델 신뢰도 조기 경보 개념 드리프트 감지 알고리즘 코딩

**11.** 블랙박스 모델의 전역 특성 영향도 분석을 위한 파셜 디펜던스 플롯 (PDP) 수식 행렬 연산 구현

**12.** 국소 비선형 경계면을 선형 대리 모델로 근사하여 이유를 설명하는 LIME 알고리즘 밑바닥 구현

**13.** 모델 편향성 검증을 위한 Demographic Parity 및 Equalized Odds 공정성 (Fairness) 메트릭 공식 코딩

### Part C. LLMOps — LLM 운영의 차별화 (14-18주차) 🆕

**14. 🆕 LLMOps의 본질: 일반 ML 운영 대비 LLM 운영의 5가지 차별점 (확률성·토큰 과금·프롬프트 버전·환각·평가)**

**15. 🆕 프롬프트 버전 관리와 A/B 테스트: Git 기반 프롬프트 레지스트리 및 트래픽 분할 라우터 구현**

**16. 🆕 토큰 단위 비용·레이턴시 모니터링 시스템: 입력/출력 토큰 추적, 모델별 단가 계산, 비용 알람 임계값 설계**

**17. 🆕 LLM 평가 자동화: LLM-as-Judge 아키텍처와 G-Eval·MT-Bench 평가 프레임워크 직접 구현**

**18. 🆕 환각 (Hallucination) 탐지·완화: Self-Consistency, NLI 기반 사실성 검증, 인용 추적 시스템 통합 구현**

### Part D. 통합 관측 및 캡스톤 (19-22주차)

**19.** 추론 요청 로그 및 성능 메트릭 수집을 위한 생산용 관측 가능성 (Observability) 플랫폼 아키텍처 연계

**20. 🆕 일반 ML·LLM 통합 모니터링 대시보드: 메트릭 계층 통일, OpenTelemetry 표준 적용 설계**

**21. 🆕 모델 가드레일과 안전성 레이어: 입력 필터·출력 검증·PII 마스킹 통합 아키텍처 구현**

**22.** **[기말고사 릴리즈]** 일반 ML과 LLM 운영이 유기적으로 통합된 통합 MLOps 시스템 평가

---

# 8. ML Systems Integration: 통합 방법론

### Part A. ML 시스템 설계의 의사결정

**01.** ML 시스템 설계의 일반 원칙: **문제 정의 → 데이터 → 모델 → 평가 → 운영**의 의사결정 트리와 각 단계 트레이드오프 분석

**02.** **모델 선택의 의사결정**: 정형/비정형 데이터, 데이터 크기, 해석 가능성 요구, 추론 비용·레이턴시, 운영 환경 5가지 축의 선택 매트릭스 구축

**03.** **결정론적 시스템과 확률론적 시스템의 조합 패턴**: Rule-based + 통계 ML + 딥러닝 모델이 같은 시스템에서 공존하는 아키텍처 설계

**04.** **모델 복잡도와 비즈니스 가치의 균형**: 1% 성능 향상이 10배 운영 비용을 정당화하는가, 결정의 수치적 프레임워크 구축

**05.** **ML 프로젝트 실패 패턴 카탈로그**: 비즈니스 정의 실패·데이터 함정·평가 메트릭 미스매치·운영 부재 등 실패 유형별 진단 체크리스트

### Part B. 데이터의 함정과 통합 처리

**06.** **데이터 누수 (Data Leakage)의 모든 형태**: Target Leakage, Train-Test Contamination, Look-ahead Bias, Group Leakage 진단 및 처방 방법론

**07.** **분포 변화 (Distribution Shift) 진단과 대응**: Covariate Shift, Label Shift, Concept Drift 수학적 정의 및 통계적 검정 (KS-Test, MMD) 통합

**08.** **불균형 데이터의 일반 해법**: SMOTE 변형군·Class Weight·Threshold Tuning·Cost-Sensitive Learning·Focal Loss의 선택 기준 및 통합 비교

**09.** **결측치·이상치의 통계적 처리**: MCAR/MAR/MNAR 메커니즘 진단·다중 대치 (Multiple Imputation)·Robust Statistics 기반 이상치 처리

**10.** **데이터 품질의 시스템적 보장**: Great Expectations·Pydantic 기반 데이터 계약 (Data Contract), 파이프라인 단계별 검증 아키텍처 설계

### Part C. 모델 통합과 하이브리드 아키텍처

**11.** **통계 모델 + 고전 ML + 딥러닝의 하이브리드 통합 패턴**: 잔차 학습 (Residual Learning), Stacking, 도메인 지식 인코딩 (Physics-Informed ML) 사례 학습

**12.** **앙상블의 일반화된 사고**: 동질적/이질적 모델 결합, 모델 가중치 학습, 동적 모델 선택 (Dynamic Model Selection) 시스템 구현

**13.** **모델 카드 (Model Card)와 데이터시트 (Datasheet) 작성법**: Google·Microsoft 표준 기반 모델 문서화, 한계점 명시, 윤리적 사용 가이드 통합

### Part D. 졸업의 마지막 선물 — 자기 주도 통합 프로젝트

**14.** **종합 프로젝트 발표**: 학생 자율 선택 문제에 1-7장의 도구와 8장의 통합 방법론을 적용한 시스템 설계 및 발표

**15.** **[기말 종합 릴리즈]** 자기 주도 통합 시스템 최종 발표 및 동료 평가 + **"4년의 회고"** 세미나 (학과 차원 졸업 작품 별도 진행)

---