param (
    [int]$N = 10
)

$a = 0
$b = 1

Write-Output "The Fibonacci series is :"

for ($i = 0; $i -lt $N; $i++) {
    Write-Output "$i`t$a"
    $fn = $a + $b
    $a = $b
    $b = $fn
}
