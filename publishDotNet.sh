VERSION=$1
mkdir publish
pushd src/DotNet/src/DotNet
dotnet publish
pushd bin/Debug/netcoreapp2.1/publish
rm ../../../../../../../../publish/example.zip
zip ../../../../../../../../publish/example.zip *.*
popd
popd
aws s3api create-bucket --bucket=terraform-serverless-example-vga --region=eu-west-2 --profile=serverless-local --create-bucket-configuration LocationConstraint=eu-west-2
aws s3 cp publish/example.zip s3://terraform-serverless-example-vga/v$VERSION/example.zip --profile=serverless-local
pushd infra/playground
terraform init
AWS_PROFILE=serverless-local terraform apply --auto-approve -var app_version=$VERSION
popd