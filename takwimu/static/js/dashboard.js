//TopicBlock, a child of StructBlock
//This is for calling extra js on the TopicBlock
//The extra js function is from the django_fontawesome app
function Topic(parentInitializer) {
    return function(elementPrefix) {
        /* call the original StructBlock initializer */
        parentInitializer(elementPrefix);
        /* do whatever JS setup you need for our new struct behaviour */
        fontawesomeIconDropdown();
    };
}
