format short
format compact
 %%

%%
% load tempvolt_110-neg2C-TMAP.mat;
% Taka �t duplicate X gildi svo interp1 ver�i glatt
for i = 1:(length(tempvolt(:,1)-3)) 
    if tempvolt(i,1) == tempvolt(i+1,1)
        tempvolt(i,:) = [];
    end
end
%% taka �t gildi ef volts h�kka 
for i = 1:(length(tempvolt(:,1)-3)) 
    if tempvolt(i,1) > tempvolt(i+1,1)
        tempvolt(i,:) = [];
    end
end
%%
vq = interp1(tempvolt(:,1),tempvolt(:,2), 0:5/256:5-5/256);
hold on
plot(0:5/256:5-5/256, vq, 'x')
plot(tempvolt(:,1),tempvolt(:,2), 'o')
newq = round(vq)+30;
%%
strengur = '';
for i = 1:length(newq)
    if isnan(newq(i))
        strengur = strcat(strengur, ', ', '0');
    else
        strengur = strcat(strengur, ', ', num2str(newq(i)));
    end
end