COMMAND="locize download --project-id $INPUT_PROJECT_ID --path $INPUT_PATH --ver $INPUT_VERSION --format $INPUT_FORMAT"

if [ ! -z "$INPUT_CDN_TYPE" ]; then
  COMMAND="$COMMAND --cdn-type $INPUT_CDN_TYPE"
fi

if [ ! -z "$INPUT_LANGUAGE" ]; then
  COMMAND="$COMMAND --language $INPUT_LANGUAGE"
fi

if [ ! -z "$INPUT_NAMESPACE" ]; then
  COMMAND="$COMMAND --namespace $INPUT_NAMESPACE"
fi

if [ ! -z "$INPUT_SKIP_EMPTY" ]; then
  COMMAND="$COMMAND --skip-empty $INPUT_SKIP_EMPTY"
fi

if [ ! -z "$INPUT_LANGUAGE_FOLDER_PREFIX" ]; then
  COMMAND="$COMMAND --language-folder-prefix $INPUT_LANGUAGE_FOLDER_PREFIX"
fi

if [ ! -z "$INPUT_PATH_MASK" ]; then
  COMMAND="$COMMAND --path-mask $INPUT_PATH_MASK"
fi

if [ ! -z "$INPUT_CLEAN" ]; then
  COMMAND="$COMMAND --clean $INPUT_CLEAN"
fi

if [ ! -z "$INPUT_UNPUBLISHED" ]; then
  COMMAND="$COMMAND --unpublished $INPUT_UNPUBLISHED"
fi

if [ ! -z "$INPUT_API_KEY" ]; then
  COMMAND="$COMMAND --api-key $INPUT_API_KEY"
fi

$COMMAND