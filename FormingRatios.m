%Read through a database and store it into a datastore
%Filters relevant information
%Removes irrelevant information
%Adds the facial asymmetry values to a table
ds = datastore("*.csv"); 
vars = ds.VariableNames;
idx = startsWith(vars, ["confidence", "x_", "y_"]); %filter out only relevant information
ds.SelectedVariableNames = vars(idx);

old = "C:\Users\Zorig\Documents\Third Year\Project\OpenFace\processed\newClasses3\"; % Remove unnecesarry names
old1 = {'.csv', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
new = '';

data1 = readall(ds);
data2 = data1.confidence > 0.90;
Table = data1(data2,:); 
Table.Properties.RowNames = replace(ds.Files, old, new);
Names = replace(Table.Properties.RowNames, old1, new);

%%
% Calculates symmetry ratio from midine to outer corner of eyes
Louteye = distanceCalc(Table.x_36, Table.x_27, Table.y_36, Table.y_27); 
Routeye = distanceCalc(Table.x_45, Table.x_27, Table.y_45, Table.y_27); 
Ratioouteye = Louteye./Routeye; 
%%
% Calculates the symmetry ratio from midline to the inner eyes
Lineye = distanceCalc(Table.x_39, Table.x_27, Table.y_39, Table.y_27); 
Rineye = distanceCalc(Table.x_42, Table.x_27, Table.y_42, Table.y_27); 
Ratioineye = Lineye./Rineye;
%%
% Calculates the symmetry ratio from the midline to the jaw
Leftnosejaw = distanceCalc(Table.x_2, Table.x_30, Table.y_2, Table.y_30); 
Rightnosejaw = distanceCalc(Table.x_14, Table.x_30, Table.y_14, Table.y_30);
Rationose2jaw = Leftnosejaw./Rightnosejaw;
%%
% Calculates the symmetry ratio from midline to nostril
Lnostril = distanceCalc(Table.x_31, Table.x_33, Table.y_31, Table.y_33); 
Rnostril = distanceCalc(Table.x_35, Table.x_33, Table.y_35, Table.y_33);
Rationostril = Lnostril./Rnostril;
%%
% Calculates the symmetry ratio from midline to edge of lips
Lmouth2mid = distanceCalc(Table.x_48, Table.x_62, Table.y_48, Table.y_62);
Rmouth2mid = distanceCalc(Table.x_54, Table.x_62, Table.y_54, Table.y_62);
Ratiomouth = Lmouth2mid./Rmouth2mid;
%%
% Calculates the symmetry ratio from the mouth midline to the jaw 
Ljaw2mouth = distanceCalc(Table.x_5, Table.x_57, Table.y_5, Table.y_57);
Rjaw2mouth = distanceCalc(Table.x_11, Table.x_57, Table.y_11, Table.y_57);
Ratiojaw2mouth = Ljaw2mouth./Rjaw2mouth;
%%
% Calculates the symmetry ratio from the midline to the edge of the jaw
Lmid2edge = distanceCalc(Table.x_0, Table.x_27, Table.y_0, Table.y_27);
Rmid2edge = distanceCalc(Table.x_16, Table.x_27, Table.y_16, Table.y_27);
Ratiomid2edge = Lmid2edge./Rmid2edge;
%%
% Calculates the symmetry ratio from midline to the edge of the jaw
Lmouth2edge = distanceCalc(Table.x_3, Table.x_51, Table.y_3, Table.y_51);
Rmouth2edge = distanceCalc(Table.x_13, Table.x_51, Table.y_13, Table.y_51);
Ratiomouth2edge = Lmouth2edge./Rmouth2edge;
%%
% Calculates the angle symmetry ratio of the lips
Lmouthangle = AngleCalc(Table.x_51, Table.x_3, Table.x_48, Table.y_51, Table.y_3, Table.y_48);
Rmouthangle = AngleCalc(Table.x_51, Table.x_13, Table.x_54, Table.y_51, Table.y_13, Table.y_54);
mouthAR = Lmouthangle./Rmouthangle;
%%
% Calculates the angle symmetry of the jaw
Ljawangle = AngleCalc(Table.x_51, Table.x_4, Table.x_6, Table.y_51, Table.y_4, Table.y_6);
Rjawangle = AngleCalc(Table.x_51, Table.x_12, Table.x_10, Table.y_51, Table.y_12, Table.y_10);
jawAR = Ljawangle./Rjawangle;
%%
% Calculates the angle symmetry of the eyes
Leyeangle = AngleCalc(Table.x_27, Table.x_36, Table.x_1, Table.y_27, Table.y_36, Table.y_1);
Reyeangle = AngleCalc(Table.x_27, Table.x_45, Table.x_15, Table.y_27, Table.y_45, Table.y_15);
eyeAR = Leyeangle./Reyeangle;
%%
% Calculates the angle symmetry of the eye tilt
Leyetilt = AngleCalc(Table.x_27, Table.x_36, Table.x_39, Table.y_27, Table.y_36, Table.y_39);
Reyetilt = AngleCalc(Table.x_27, Table.x_45, Table.x_42, Table.y_27, Table.y_45, Table.y_42);
eyetiltAR = Leyetilt./Reyetilt;
%%
% Calculates the angle symmetry of nostrils
Lnosetilt = AngleCalc(Table.x_33, Table.x_31, Table.x_3, Table.y_33, Table.y_31, Table.y_3);
Rnosetilt = AngleCalc(Table.x_33, Table.x_35, Table.x_13, Table.y_33, Table.y_35, Table.y_13);
nosetiltAR = Lnosetilt./Rnosetilt;
%%
% Calculates the angle symmetry of the eyebrows
Lbrowtilt = AngleCalc(Table.x_27, Table.x_21, Table.x_17, Table.y_27, Table.y_21, Table.y_17);
Rbrowtilt = AngleCalc(Table.x_27, Table.x_22, Table.x_26, Table.y_27, Table.y_22, Table.y_26);
browtiltAR = Lbrowtilt./Rbrowtilt;
%%
% Add the variables to a table
SymmetryTable = table(Names, Ratioouteye, Ratioineye, Rationose2jaw, Rationostril, Ratiomouth, Ratiojaw2mouth, Ratiomid2edge, Ratiomouth2edge, mouthAR, jawAR, eyeAR, eyetiltAR, nosetiltAR, browtiltAR);




