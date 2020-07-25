param(

    $action,
    $file

)

if (Test-Path $file) {
    $counter = (Get-Content $file | Measure-Object -Character).Characters
    $string = Get-Content $file
}
else {
    $file = Invoke-WebRequest $file
    $counter = $file.RawContentLength
    $string = $file.Content

}
if ($counter -gt 0) {

    if ($action -eq 'count') {
        $counter
    }
    elseif ($action -eq 'invert') {

        $string[-1.. - $string.Length] -join ''
    }
    else {
        Write-Error 'Please add the right parameters'
    }

}
else {
    Write-Warning 'this file is empty'
}


