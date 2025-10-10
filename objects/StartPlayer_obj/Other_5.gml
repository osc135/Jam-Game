if (instance_exists(heldItem)) {
    instance_destroy(heldItem);
    heldItem = noone;
}