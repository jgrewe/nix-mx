% Copyright (c) 2016, German Neuroinformatics Node (G-Node)
%
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted under the terms of the BSD License. See
% LICENSE file in the root of the Project.

classdef Group < nix.NamedEntity & nix.MetadataMixIn & nix.SourcesMixIn
    %Group nix Group object

    properties (Hidden)
        % namespace reference for nix-mx functions
        alias = 'Group'
    end

    methods
        function obj = Group(h)
            obj@nix.NamedEntity(h);
            obj@nix.MetadataMixIn();
            obj@nix.SourcesMixIn();

            % assign relations
            nix.Dynamic.add_dyn_relation(obj, 'dataArrays', @nix.DataArray);
            nix.Dynamic.add_dyn_relation(obj, 'tags', @nix.Tag);
            nix.Dynamic.add_dyn_relation(obj, 'multiTags', @nix.MultiTag);
        end;

        % -----------------
        % DataArray methods
        % -----------------

        function c = data_array_count(obj)
            c = nix_mx('Group::dataArrayCount', obj.nix_handle);
        end

        function hasDataArray = has_data_array(obj, id_or_name)
            hasDataArray = nix_mx('Group::hasDataArray', ...
                obj.nix_handle, id_or_name);
        end;

        function retObj = get_data_array(obj, id_or_name)
            retObj = nix.Utils.open_entity(obj, ...
                'Group::getDataArray', id_or_name, @nix.DataArray);
        end;

        function retObj = open_data_array_idx(obj, idx)
            retObj = nix.Utils.open_entity(obj, ...
                'Group::openDataArrayIdx', idx, @nix.DataArray);
        end

        function [] = add_data_array(obj, add_this)
            nix.Utils.add_entity(obj, add_this, ...
                'nix.DataArray', 'Group::addDataArray');
        end;

        function [] = add_data_arrays(obj, add_cell_array)
            nix.Utils.add_entity_array(obj, add_cell_array, ...
                'nix.DataArray', strcat(obj.alias, '::addDataArrays'));
        end

        function delCheck = remove_data_array(obj, del)
            delCheck = nix.Utils.delete_entity(obj, del, ...
                'nix.DataArray', 'Group::removeDataArray');
        end;

        function filtered = filter_data_arrays(obj, filter, val)
            filtered = nix.Utils.filter(obj, filter, val, ...
                'Group::dataArraysFiltered', @nix.DataArray);
        end

        % -----------------
        % Tags methods
        % -----------------

        function [] = add_tag(obj, add_this)
            nix.Utils.add_entity(obj, add_this, ...
                'nix.Tag', 'Group::addTag');
        end;

        function [] = add_tags(obj, add_cell_array)
            nix.Utils.add_entity_array(obj, add_cell_array, ...
                'nix.Tag', strcat(obj.alias, '::addTags'));
        end

        function hasTag = has_tag(obj, id_or_name)
            hasTag = nix_mx('Group::hasTag', obj.nix_handle, id_or_name);
        end;

        function retObj = get_tag(obj, id_or_name)
            retObj = nix.Utils.open_entity(obj, ...
                'Group::getTag', id_or_name, @nix.Tag);
        end;

        function retObj = open_tag_idx(obj, idx)
            retObj = nix.Utils.open_entity(obj, ...
                'Group::openTagIdx', idx, @nix.Tag);
        end

        function delCheck = remove_tag(obj, del)
            delCheck = nix.Utils.delete_entity(obj, del, ...
                'nix.Tag', 'Group::removeTag');
        end;

        function c = tag_count(obj)
            c = nix_mx('Group::tagCount', obj.nix_handle);
        end

        function filtered = filter_tags(obj, filter, val)
            filtered = nix.Utils.filter(obj, filter, val, ...
                'Group::tagsFiltered', @nix.Tag);
        end

        % -----------------
        % MultiTag methods
        % -----------------
        
        function [] = add_multi_tag(obj, add_this)
            nix.Utils.add_entity(obj, add_this, ...
                'nix.MultiTag', 'Group::addMultiTag');
        end;

        function [] = add_multi_tags(obj, add_cell_array)
            nix.Utils.add_entity_array(obj, add_cell_array, ...
                'nix.MultiTag', strcat(obj.alias, '::addMultiTags'));
        end

        function hasMTag = has_multi_tag(obj, id_or_name)
            hasMTag = nix_mx('Group::hasMultiTag', ...
                obj.nix_handle, id_or_name);
        end;

        function retObj = get_multi_tag(obj, id_or_name)
            retObj = nix.Utils.open_entity(obj, ...
                'Group::getMultiTag', id_or_name, @nix.MultiTag);
        end;

        function retObj = open_multi_tag_idx(obj, idx)
            retObj = nix.Utils.open_entity(obj, ...
                'Group::openMultiTagIdx', idx, @nix.MultiTag);
        end

        function delCheck = remove_multi_tag(obj, del)
            delCheck = nix.Utils.delete_entity(obj, del, ...
                'nix.MultiTag', 'Group::removeMultiTag');
        end

        function c = multi_tag_count(obj)
            c = nix_mx('Group::multiTagCount', obj.nix_handle);
        end

        function filtered = filter_multi_tags(obj, filter, val)
            filtered = nix.Utils.filter(obj, filter, val, ...
                'Group::multiTagsFiltered', @nix.MultiTag);
        end
    end;

end
