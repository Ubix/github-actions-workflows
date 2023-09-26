#!/bin/bash

#This shellscript is used to import the trivy scan to defect dojo

#Authentication variables
AUTH_HEADER="Authorization: Token $AUTH_HEADER_ENV"


#Date environment variables
YEAR=`date +%Y`
MONTH=`date +%B`
SCAN_EXEC_DATE=`date +%Y-%m-%d`

#Context variables
SERVICE="service=$ECR_REPOSITORY"
ENGAGEMENT_NAME="engagement_name=$YEAR $MONTH Security Report"
URL=$DOJO_URL


echo "ENGAGEMENT_NAME=engagement_name=$YEAR $MONTH Security Report"

# Define variables for the parameters

ACCEPT_HEADER="accept: application/json"
CONTENT_TYPE_HEADER="Content-Type: multipart/form-data"
CSRFTOKEN_HEADER="X-CSRFTOKEN: mycsrftoken"
PRODUCT_TYPE="product_type_name="
ACTIVE="active=true"
ENDPOINT_TO_ADD="endpoint_to_add="
VERIFIED="verified=true"
CLOSE_OLD_FINDINGS="close_old_findings=false"
TEST_TITLE="test_title="
BUILD_ID="build_id="
DEDUPLICATION_ON_ENGAGEMENT="deduplication_on_engagement=true"
PUSH_TO_JIRA="push_to_jira=false"
MINIMUM_SEVERITY="minimum_severity=Info"
CLOSE_OLD_FINDINGS_PRODUCT_SCOPE="close_old_findings_product_scope=false"
SCAN_DATE="scan_date=$SCAN_EXEC_DATE"
CREATE_FINDING_GROUPS="create_finding_groups_for_all_findings=true"
ENGAGEMENT_END_DATE="engagement_end_date="
ENVIRONMENT="environment=Development"
COMMIT_HASH="commit_hash="
GROUP_BY="group_by=finding_title"
VERSION="version="
TAGS="tags=\"Jmeter-Kubernetes\""
API_SCAN_CONFIGURATION="api_scan_configuration="
FILE="file=@/tmp/results.json;type=application/json"
AUTO_CREATE_CONTEXT="auto_create_context="
LEAD="lead="
SCAN_TYPE="scan_type=Trivy Scan"
BRANCH_TAG="branch_tag="
SOURCE_CODE_MANAGEMENT_URI="source_code_management_uri="
ENGAGEMENT="engagement="

# Construct the curl command
curl -X 'POST' $URL \
  -H "$AUTH_HEADER" \
  -H "$CONTENT_TYPE_HEADER" \
  -H "$CSRFTOKEN_HEADER" \
  -F "$PRODUCT_TYPE" \
  -F "$ACTIVE" \
  -F "$ENDPOINT_TO_ADD" \
  -F "$VERIFIED" \
  -F "$CLOSE_OLD_FINDINGS" \
  -F "$TEST_TITLE" \
  -F "$ENGAGEMENT_NAME" \
  -F "$BUILD_ID" \
  -F "$DEDUPLICATION_ON_ENGAGEMENT" \
  -F "$PUSH_TO_JIRA" \
  -F "$MINIMUM_SEVERITY" \
  -F "$CLOSE_OLD_FINDINGS_PRODUCT_SCOPE" \
  -F "$SCAN_DATE" \
  -F "$CREATE_FINDING_GROUPS" \
  -F "$ENGAGEMENT_END_DATE" \
  -F "$ENVIRONMENT" \
  -F "$SERVICE" \
  -F "$COMMIT_HASH" \
  -F "$GROUP_BY" \
  -F "$VERSION" \
  -F "$TAGS" \
  -F "$API_SCAN_CONFIGURATION" \
  -F 'product_name=Ubix' \
  -F "$FILE" \
  -F "$AUTO_CREATE_CONTEXT" \
  -F "$LEAD" \
  -F "$SCAN_TYPE" \
  -F "$BRANCH_TAG" \
  -F "$SOURCE_CODE_MANAGEMENT_URI" \
  -F "$ENGAGEMENT"
