{ pkgs, ... }:
{
  enable = true;
  package = pkgs.javaPackages.compiler.temurin-bin.jdk-25;
}
