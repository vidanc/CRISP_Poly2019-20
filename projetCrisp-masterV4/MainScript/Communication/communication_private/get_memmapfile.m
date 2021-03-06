function [ m ] = get_memmapfile( )
%get_memmapfile Fonction qui retourne un memmapfile object, m tel qu'utilis�
%   dans le CommBot.

fprintf('Cr�ation du fichier m�moire (memmapfile)\n');

filename = 'Communication/commands.dat';
command_size = [2,10];
format = {'uint8', command_size, 'pos_1';...
          'uint8', command_size, 'pos_2';...
          'uint8', command_size, 'pos_3';...
          'uint8', command_size, 'pos_4';...
          'uint8', command_size, 'pos_5';...
          'uint8', command_size, 'pos_6';...
          'uint8', command_size, 'vit_1';...
          'uint8', command_size, 'vit_2';...
          'uint8', command_size, 'vit_3';...
          'uint8', command_size, 'vit_4';...
          'uint8', command_size, 'vit_5';...
          'uint8', command_size, 'vit_6';...
          'uint8', command_size, 'acc_1';...
          'uint8', command_size, 'acc_2';...
          'uint8', command_size, 'acc_3';...
          'uint8', command_size, 'acc_4';...
          'uint8', command_size, 'acc_5';...
          'uint8', command_size, 'acc_6';...
          'uint8', command_size, 'ls_1_1';...
          'uint8', command_size, 'ls_1_2';...
          'uint8', command_size, 'ls_2_1';...
          'uint8', command_size, 'ls_2_2';...
          'uint8', command_size, 'ls_3_1';...
          'uint8', command_size, 'ls_3_2';...
          'uint8', command_size, 'ls_4_1';...
          'uint8', command_size, 'ls_4_2';...
          'uint8', command_size, 'ls_5_1';...
          'uint8', command_size, 'ls_5_2';...
          'uint8', command_size, 'ls_6_1';...
          'uint8', command_size, 'ls_6_2';...
          'uint8', command_size, 'tl_1';...
          'uint8', command_size, 'tl_2';...
          'uint8', command_size, 'tl_3';...
          'uint8', command_size, 'tl_4';...
          'uint8', command_size, 'tl_5';...
          'uint8', command_size, 'tl_6';...
          'uint8', command_size, 't_1';...
          'uint8', command_size, 't_2';...
          'uint8', command_size, 't_3';...
          'uint8', command_size, 't_4';...
          'uint8', command_size, 't_5';...
          'uint8', command_size, 't_6';...
          'uint8', command_size, 'Vmax_1';...
          'uint8', command_size, 'Vmax_2';...
          'uint8', command_size, 'Vmax_3';...
          'uint8', command_size, 'Vmax_4';...
          'uint8', command_size, 'Vmax_5';...
          'uint8', command_size, 'Vmax_6';...
          'uint8', command_size, 'Idemar_1';...
          'uint8', command_size, 'Idemar_2';...
          'uint8', command_size, 'Idemar_3';...
          'uint8', command_size, 'Idemar_4';...
          'uint8', command_size, 'Idemar_5';...
          'uint8', command_size, 'Idemar_6';...
          'uint8', command_size, 'CoupleP_1';...
          'uint8', command_size, 'CoupleP_2';...
          'uint8', command_size, 'CoupleP_3';...
          'uint8', command_size, 'CoupleP_4';...
          'uint8', command_size, 'CoupleP_5';...
          'uint8', command_size, 'CoupleP_6';...
          'uint8', command_size, 'CoupleI_1';...
          'uint8', command_size, 'CoupleI_2';...
          'uint8', command_size, 'CoupleI_3';...
          'uint8', command_size, 'CoupleI_4';...
          'uint8', command_size, 'CoupleI_5';...
          'uint8', command_size, 'CoupleI_6';...
          'uint8', command_size, 'VitesseP_1';...
          'uint8', command_size, 'VitesseP_2';...
          'uint8', command_size, 'VitesseP_3';...
          'uint8', command_size, 'VitesseP_4';...
          'uint8', command_size, 'VitesseP_5';...
          'uint8', command_size, 'VitesseP_6';...
          'uint8', command_size, 'VitesseI_1';...
          'uint8', command_size, 'VitesseI_2';...
          'uint8', command_size, 'VitesseI_3';...
          'uint8', command_size, 'VitesseI_4';...
          'uint8', command_size, 'VitesseI_5';...
          'uint8', command_size, 'VitesseI_6';...
          'uint8', command_size, 'PositionP_1';...
          'uint8', command_size, 'PositionP_2';...
          'uint8', command_size, 'PositionP_3';...
          'uint8', command_size, 'PositionP_4';...
          'uint8', command_size, 'PositionP_5';...
          'uint8', command_size, 'PositionP_6';...
          'uint8', command_size, 'c_1';...
          'uint8', command_size, 'c_2';...
          'uint8', command_size, 'c_3';...
          'uint8', command_size, 'c_4';...
          'uint8', command_size, 'c_5';...
          'uint8', command_size, 'c_6';...
          'uint8', command_size, 'free'};
          
          
% Create the communications file if it is not already there.
if ~exist(filename, 'file')
    [f, msg] = fopen(filename, 'wb');
    if f ~= -1
        patch = zeros(size(format,1)*length(command_size));
        fwrite(f, patch, 'uint8');
        fclose(f);
    else
        error('MATLAB:demo:answer:cannotOpenFile', ...
              'Cannot open file "%s": %s.', filename, msg);
    end
end

% Memory map the file.
m = memmapfile(filename, 'Writable', true, 'Format', format);


end

