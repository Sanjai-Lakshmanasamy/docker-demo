set -e

VERSION="v1"

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo " "
      echo "options:"
      echo "-h,--help                                 show brief help"
      echo "-v,  --version                            version of the package, default: 1.0.0"
      exit 0
      ;;
    -v|--version)
      shift
      if test $# -gt 0; then
        export VERSION=$1
      else
        echo "no version specified"
        exit 1
      fi
      shift
      ;;
    *)
      break
      ;;
  esac
done

mkdir demo_$VERSION

cp {deploy.sh, docker-compose.yaml, Dockerfile, index.html} demo_$VERSION/

tar -zcf demo_$VERSION.tar.gz demo_$VERSION