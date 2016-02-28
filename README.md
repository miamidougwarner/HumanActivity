###README.md

#Getting and Cleaning Data Course Project README


##Introduction

The data originates from a human activity experiment. Measurements
where taken with a smartphone.


##Original Experiment Description and Credit

===================================================================================================
###Human Activity Recognition Using Smartphones Dataset
Version 1.0
===================================================================================================
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università  degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws 
===================================================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


##Project Work

The final analysis file, run_analysis.R is a top-level script. It levers some
functions like get.measurements() & get.volunteer.data() that do lower
level work to read in data. Those tasks would just clutter run_analysis if 
present.

Since the low level tasks are assigned to separate functions, it is necessary
to source them prior to executing, run_analysis.

The project asked for, *measurements on the mean and standard deviation for each measurement*.
Only columns with the basic function mean() and std() are included. Other types of
mean calculations including gravityMean() and frequencyMean() are excluded.


For step 4 (data set labels), this action was done at the top of run_analysis.
After the feature table was read in, the column names are made *unique* and then
a few statements later, attached to the measurements.



##Final Output - Step 5

The object of the project is to submit a tidy dataset that could
potentially be used later for analysis. 

Below is an  independent tidy data set with the average of each variable for each activity and each subject.

This dataset is tidy because:
1. Each variable (activity) forms a column
2. Each observation (volunteer or subject from the experiment) forms a row
3. This observational unit forms a table.


`"volunteer.id" "laying" "sitting" "standing" "walking" "walking_downstairs" "walking_upstairs"
 1 -0.423333380675694 -0.443739157069518 -0.472358328950658 -0.0519791887565576 -0.00455539466082233 -0.166877496100821
 2 -0.432062300327702 -0.427062676605444 -0.435651310356422 -0.115278398838465 0.0463516234334418 -0.0924910915510172
 3 -0.392341356089777 -0.376622226938218 -0.386928461362701 -0.091233116628286 -0.0147808432354622 -0.127188251065558
 4 -0.364244874392308 -0.352314808568627 -0.346943410730327 -0.103105854245549 -0.0117672042917843 -0.0774815714712409
 5 -0.343472389854825 -0.322630146925519 -0.311998283637915 -0.00352034901754884 0.10524126657916 0.0214667306713204
 6 -0.299183871190557 -0.293041636924615 -0.304483895317828 0.0765486310728741 0.248395199710245 0.0900478524456055
 7 -0.275354457972783 -0.265141938355074 -0.276618698740966 0.125273424311127 0.145472226249424 -0.0191337436063033
 8 -0.24181008287183 -0.239779366963049 -0.253866096157571 0.174288597571044 0.318732313547926 0.186317367873902
 9 -0.228402323699012 -0.201978733589353 -0.208956107306412 0.115766520837024 0.206341089661291 0.056985317791416
 10 -0.231769485272297 -0.193636867447936 -0.180998094185348 0.212405572390609 0.293875242067206 0.199064331544247
 11 -0.162689873381326 -0.152566539018285 -0.170838728489249 0.107544487753567 0.228904330820518 0.0906477620802124
 12 -0.130532886384075 -0.124727045637168 -0.126666457122758 0.233760828011512 0.29141721257288 0.145239811468948
 13 -0.0980733497868776 -0.101838754860052 -0.113903901743277 0.285663694871543 0.325847375392212 0.181916338101513
 14 -0.052873601336793 -0.073945800822537 -0.0850388460456721 0.239251741499702 0.462251371331431 0.346168473122124
 15 -0.0472297318743668 -0.0416162493902213 -0.0458363002847908 0.280216560678632 0.423372429543726 0.278734136030705
 16 -0.0266064880317626 -0.0154008141065516 -0.0263270397078322 0.250722744077999 0.375813808168855 0.230543569976574
 17 0.0213572259680804 0.00324527107004596 -0.00812975256386124 0.324442993063047 0.386397452466176 0.324432470442575
 18 0.039895244328629 0.0432643175110336 0.0328626049040713 0.300477861399874 0.303614477217053 0.255209504479707
 19 0.0647907962279921 0.0875587591458284 0.0712388160102704 0.576851959991155 0.760552962911486 0.476776874479559
 20 0.0990376562595125 0.112501219730116 0.119391660599647 0.58102103371843 0.60819772369772 0.480948516965133
 21 0.139952260490069 0.12665745166645 0.117346239648353 0.49173718612612 0.575445351978935 0.445089859663736
 22 0.173097914194873 0.178135184920593 0.163457726082554 0.593080878310081 0.61583847590169 0.56546346013708
 23 0.189168824643223 0.198791838830236 0.183910137762503 0.66172534842182 0.759594004518252 0.541692682051534
 24 0.221320249848186 0.224063838325803 0.217430420940964 0.503800701396501 0.588416320731973 0.48829202317817
 25 0.297688037391732 0.253481678632475 0.247578996576744 0.481378542368168 0.538735064568119 0.461062296659674
 26 0.270957549534217 0.286592413253289 0.274678445342357 0.599049956186904 0.70051370046723 0.576893890135037
 27 0.300027570921292 0.31321281136671 0.299331964459372 0.623633588596005 0.732347305291491 0.565468743595761
 28 0.304099209070281 0.341006749656634 0.348482873914844 0.654440116516138 0.797273701929834 0.633617999792336
 29 0.362308424257327 0.371512104567118 0.359657739274489 0.736928940055733 0.792518897294488 0.720924858554316
 30 0.400817232788618 0.404389162306358 0.409556856423383 0.740736963590136 0.782917369182315 0.667590280661795
`


