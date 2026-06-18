# Resolve credentials: the 'with:' input first, then environment variables,
# accepting both the canonical (LOCIZE_PROJECTID / LOCIZE_API_KEY) and the
# underscore/concatenated variants so any existing secret naming just works.
# api-key is optional here (only needed for unpublished downloads).
PROJECT_ID="${INPUT_PROJECT_ID:-${LOCIZE_PROJECTID:-${LOCIZE_PROJECT_ID:-}}}"
API_KEY="${INPUT_API_KEY:-${LOCIZE_API_KEY:-${LOCIZE_APIKEY:-}}}"

if [ -z "$PROJECT_ID" ]; then
  echo "::error::Missing project id. Pass it via 'with: project-id:' or set LOCIZE_PROJECTID (LOCIZE_PROJECT_ID also accepted) in the environment." >&2
  exit 1
fi

COMMAND="locize download --project-id $PROJECT_ID --path $INPUT_PATH --ver $INPUT_VERSION --format $INPUT_FORMAT"

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

if [ ! -z "$API_KEY" ]; then
  COMMAND="$COMMAND --api-key $API_KEY"
fi

$COMMAND