%% -------------------------------------
% Here is a short Primer on how to access NIX file from Matlab 
% using nix-mx.
% --------------------------------------

path = 'C:\projects\nix-mx\tests\test.h5';

% Open NIX file
f = nix.File(path, nix.FileMode.ReadOnly);

% file contents overview
disp(f);

% display all Block names
cellfun(@(x) disp(x.name), f.blocks);

% get a certain Block
b = f.blocks{2};

% --------------------------------------

% get Data Arrays of a certain type
idx = cellfun(@(x) strcmp(x.type, 'nix.spiketimes'), b.dataArrays);
selection1 = b.dataArrays(idx);

% get DataArrays by several criteria
cond1 = @(x) ~isempty(strfind(x.name, 'SpikeActivity'));
cond2 = @(x) any(cellfun(@(y) strcmp(y.name, 'Unit 7'), x.sources));
cond3 = @(x) x.open_metadata.properties_map('Target') == 2;
cond4 = @(x) x.open_metadata.properties_map('ExperimentalCondition') == 3;
idx = cellfun(@(x) cond1(x) & cond2(x) & cond3(x) & cond4(x), b.dataArrays);
selection2 = b.dataArrays(idx);

% --------------------------------------

% explore root metadata Sections (type, name)
cellfun(@(x) disp(strcat(x.type, ': ', x.name)), f.sections);

% access subsections
sec = f.sections{2}.sections{1};

% display all Section properties
cellfun(@(x) disp(x), sec.props);

% get a certain Value
value = sec.props{1}.values{1};
