
$functionName="Learn-Azure-DevOps-SnsProcessor"
$zipName="SnsProcessor.zip"
$s3Bucket="learners-lambda-bucket/LearnAzureDevOps"

Push-Location $PSScriptRoot

$project=Split-Path -Path $PSScriptRoot -Leaf

dotnet lambda package --configuration Release --framework net6.0

aws s3 cp "bin/Release/net6.0/$project.zip" "s3://$s3Bucket/$zipName"

# aws lambda create-function --function-name $functionName --s3-bucket learners-lambda-bucket --s3-key $zipName --role "Lambda-Demo-Role"
aws lambda update-function-code --function-name $functionName --s3-bucket learners-lambda-bucket --s3-key LearnAzureDevOps/SnsProcessor.zip

Pop-Location