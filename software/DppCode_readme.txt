This package is provided for reproducing the results in :
Jinye Zhang, Zhijian Ou. Block-Wise MAP Inference for Determinantal Point Processes with Application to Change-Point Detection. IEEE Workshop on Statistical Signal Processing (SSP), Palma de Mallorca, Spain, 2016,6.

All rights are preserved by Speech Processing and Machine Intelligence(SPMI) lab, Tsinghua University.
Authors: Martin J. Zhang, and Zhijian Ou

----
The details of experiements in this paper are illustrated below.

The implementation details of BwDppCpd is in ./BwDppCpd/Test.m
The implementation details of BwDPP-MAP is in ./BwDPP-MAP/Test.m

1. The simulation: ./CPD_Simu
Processing: ./CPD_Simu/Test.m
Figure plotting: 
	Fig 2 (a): ./CPD_Simu/PlotDataExpl.m; Data.pdf
	Fig 2 (b): ./CPD_Simu/PlotResult.m; AprRT.pdf

2. Well-log data expermient [1]: ./CPD_welllog/ 
Data: ./CPD_welllog/well-log.txt
Processing and figure ploting: ./CPD_welllog/Test.m
Fig. 3 (a): ./CPD_welllog/WellLogData.pdf

3. Coal mine disaster [2]: ./CPD_CoalMining
Data: ./CPD_CoalMining/CoalMiningData.m
Processing and figure ploting: ./CPD_CoalMining/Test.m
Fig. 3 (b): ./CPD_welllog/CoalMining.pdf

4. 1972-75 Dow Jones Industrial Average Return (DIJA) [1]: ./CPD_DJI
Data: ./CPD_DJI/DJIA.csv
Processing and figure ploting: ./CPD_DJI/Test.m
Fig. 3 (c): ./CPD_DJI/DJI.pdf

5. Hasc data ./CPD_Hasc    (reference: http://hasc.jp/hc2011/)
Hasc data processed by BwDppCpd: ./CPD_Hasc/Hasc
	Data: ./CPD_Hasc/Hasc/TestData/
	Processing: ./CPD_Hasc/Hasc/RocTestBench.m
Hasc data processed by RULSIF: ./CPD_Hasc/RULSIF
	Data: ./CPD_Hasc/RULSIF/TestData/
	Processing: ./CPD_Hasc/RULSIF/Evaluation.m
Figure plotting: 
	Fig. 4: ./CPD_Hasc/resultplot/ResultPlot.m

6. Speech segmentation ./CPD_SpeechSeg/
	Speech demo: 
		Data: ./CPD_SpeechSeg/TestFlie.wav
		Fig. 1 (a) (b): ./CPD_SpeechSeg/PlotData.m
	Hub4m97 data: (from 1997 Mandarin Broadcast News Speech (HUB4-NE) released by LDC, http://catalog.ldc.upenn.edu/LDC98S73)
		Processing: ./CPD_SpeechSeg/TestBench.m
	TelRecord: (this data is licensed from a third party, not provided for public use)
		Processing: ./CPD_SpeechSeg/TestBenchTel.m

Reference: 
[1] Ryan Prescott Adams and David JC MacKay, Bayesian online changepoint detection, arXiv preprint arXiv:0710.3742, 2007.
[2] RG Jarrett, A note on the intervals between coal-mining disasters, Biometrika, vol. 66, no. 1, pp. 191¨C193, 1979.
