<?php
// vim: set tabstop=2:softtabstop=2:shiftwidth=2:noexpandtab

// array with numbers from 1 to 10

$numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// loop through

foreach ($numbers as $num) {
    // echo $num;
}

// with index
foreach ($numbers as $index => $num) {
    // echo  "$num @$index"
}

// sum
// array_sum($numbers);

$doubles = array_map(function ($num) {
    return $number * 2;
}, $numbers);


// even
$even = array_filter($numbers, function ($num) {
    return $num % 2 == 0;
});

// even

$firstGreaterThanFive = null;

foreach ($numbers as $num) {
    if ($num > 5) {
        $firstGreaterThanFive = $num;
        break;
    }
}
