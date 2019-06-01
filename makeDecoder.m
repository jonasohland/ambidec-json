function makeDecoder(lss, method, maxre, order, name, spknames)

decoder = ambiDecoder(lss, method, maxre, order);


output = struct();

output.decoder = decoder;
output.order = order;
output.format = 'acn';
output.coords = lss;
output.type = method;
output.maxre = maxre;
[output.spks, output.harmonics] = size(lss);

if (maxre)
    maxre_append = "_maxre";
else
    maxre_append = "";
end

output.name = strcat(name, '_', method, '_o', num2str(order), maxre_append);

if exist('spknames', 'var')
    output.spknames = spknames;
end



file = fopen(strcat(output.name, '.json'), 'w');

fprintf(file, jsonencode(output));