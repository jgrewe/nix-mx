classdef Block < nix.Entity
    %FILE nix Block object
    
    properties(Hidden)
        info
    end;
    
    properties(Dependent)
        name
        type
        id
        sourceCount
        dataArrayCount
        tagCount
        multiTagCount
    end;
    
    methods
        function obj = Block(h)
           obj@nix.Entity(h);
           obj.info = nix_mx('Block::describe', obj.nix_handle);
        end;
        
        function name = get.name(block)
           name = block.info.name;
        end;
        
        function type = get.type(block)
            type = block.info.type;
        end;
        
        function id = get.id(block)
           id = block.info.id; 
        end;
        
        function sourceCount = get.sourceCount(block)
            sourceCount = block.info.sourceCount;
        end;
        
        function dataArrayCount = get.dataArrayCount(block)
            dataArrayCount = block.info.dataArrayCount;
        end;
        
        function tagCount = get.tagCount(block)
            tagCount = block.info.tagCount;
        end;
        
        function multiTagCount = get.multiTagCount(block)
            multiTagCount = block.info.multiTagCount;
        end;
        
        function das = data_arrays(obj)
            das = nix_mx('Block::listDataArrays', obj.nix_handle);
        end;
        
        function da = data_array(obj, id_or_name)
           dh = nix_mx('Block::openDataArray', obj.nix_handle, id_or_name); 
           da = nix.DataArray(dh);
        end;
        
        function tagList = list_tags(obj)
            tagList = nix_mx('Block::listTags', obj.nix_handle);
        end;
        
        function hasTag = has_tag(obj, id_or_name)
            hasTag = nix_mx('Block::hasTag', obj.nix_handle, id_or_name);
        end;
        
        function tag = open_tag(obj, id_or_name)
           tagHandle = nix_mx('Block::openTag', obj.nix_handle, id_or_name); 
           tag = nix.Tag(tagHandle);
        end;
    end;

end
