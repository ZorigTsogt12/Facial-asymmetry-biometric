%Iterates through the names of the predictions and the names of the inputs
%and outputs the number of matches

true = 0;
total = height(SymmetryPred);
for i=1:1:total
    
    %If the name in the input and predictions match then increment true
    if ismember(SymmetryPred.Names(i), prediction(i))
        true = true + 1;
    else 
        disp(SymmetryPred.Names(i))
    end
    
end

%Calculate the accuracy
accuracy = (true/total)*100