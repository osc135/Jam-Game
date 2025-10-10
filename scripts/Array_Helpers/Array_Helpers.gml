/// array_index_of(_arr, _val)
function array_index_of(_arr, _val) {
    for (var i = 0; i < array_length(_arr); i++) {
        if (_arr[i] == _val) return i;
    }
    return -1;
}