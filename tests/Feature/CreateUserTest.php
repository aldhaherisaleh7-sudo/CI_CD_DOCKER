<?php

use App\Models\User;

it('create users', function () {
    $users = User::factory(10)->create();

    expect($users->count())->toBe(10);
});
