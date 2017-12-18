* All rights of the data reserved for Speech Processing and Machine Intelligence Lab (SPMILab), Tsinghua University, Beijing *

This data release contains: 
9h-radio.wav
annotation.txt
motif-names.txt
labeled-names.txt

The 9h-radio.wav (u-law compressed) is the continuous 9-hour real-world audio stream recorded from a public broadcast radio in Beijing. 
It is manually annotated with labeled segment names. Segments that are meaningful (e.g., commercials, signature tunes and even entire programs and songs) and of longer durations are identified and labeled with priority. There could be overlapping between labeled segments.

The annotation.txt is the annotation file that contains 783 segments varying from 1s to tens of minutes.
A motif instance is a labeled segment that repeats in the audio. A motif has at least two motif instances. There are a total of 139 motifs, as listed in motif-names.txt.

labeled-names.txt contains the 193 labeled names used for Synthetic Data Generation.

Reference:
Haotian Xu, Zhijian Ou. Scalable Discovery of Audio Fingerprint Motifs in Broadcast Streams with Determinantal Point Process based Motif Clustering. ACM/IEEE Transactions on Audio, Speech and Language Processing, 2016, 24(5):978 - 989.
