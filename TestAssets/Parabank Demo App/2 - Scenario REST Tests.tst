---
parasoftVersion: 2025.3.0
productVersion: 10.7.4
schemaVersion: 03
suite:
  $type: TestSuite
  name: (DOUBLE CLICK - READ NOTES)
  hasEnvironmentConfig: true
  environmentConfig:
    environments:
    - variables:
      - name: OPENAPI
        value: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
      - name: BASEURL
        value: https://parabank.parasoft.com/parabank/services/bank
      name: Public
      active: true
  lastModifiedBy: whaaker
  performance:
    groups:
    - name: "/accounts/{accountId} - GET"
    - id: 1
      name: "/accounts/{accountId}/transactions - GET"
    - id: 2
      name: "/accounts/{accountId}/transactions/amount/{amount} - GET"
    - id: 3
      name: "/accounts/{accountId}/transactions/fromDate/{fromDate}/toDate/{toDate}\
        \ - GET"
    - id: 4
      name: "/accounts/{accountId}/transactions/month/{month}/type/{type} - GET"
    - id: 5
      name: "/accounts/{accountId}/transactions/onDate/{onDate} - GET"
    - id: 6
      name: /billpay - POST
    - id: 7
      name: /cleanDB - POST
    - id: 8
      name: /createAccount - POST
    - id: 9
      name: "/customers/update/{customerId} - POST"
    - id: 10
      name: "/customers/{customerId} - GET"
    - id: 11
      name: "/customers/{customerId}/accounts - GET"
    - id: 12
      name: "/customers/{customerId}/buyPosition - POST"
    - id: 13
      name: "/customers/{customerId}/positions - GET"
    - id: 14
      name: "/customers/{customerId}/sellPosition - POST"
    - id: 15
      name: /deposit - POST
    - id: 16
      name: /initializeDB - POST
    - id: 17
      name: "/login/{username}/{password} - GET"
    - id: 18
      name: "/positions/{positionId} - GET"
    - id: 19
      name: "/positions/{positionId}/{startDate}/{endDate} - GET"
    - id: 20
      name: /requestLoan - POST
    - id: 21
      name: "/setParameter/{name}/{value} - POST"
    - id: 22
      name: /shutdownJmsListener - POST
    - id: 23
      name: /startupJmsListener - POST
    - id: 24
      name: "/transactions/{transactionId} - GET"
    - id: 25
      name: /transfer - POST
    - id: 26
      name: /withdraw - POST
  notes: |-
    This is the root Test Suite.  SOAtest Test (.tst) Files are primarily made up of Test Suite and Test nodes within the root Test Suite.  Tests are generally executed in sequential order and organized in Test Suites.  Use the right-click context menu to add new Test Suites and drag & drop or copy/cut & paste Tests or Test Suites for organization in a Test (.tst) File.

    Test Suite Tabs > Variables: Here you can define general data to reference in your Tests that is not Environment dependent (i.e., won't change between Environments, but you want a single place to define variables).

    Environments node: This is where you can specify environment variables (e.g., BASEURL) and multiple environments to be able to easily re-use Tests for different environments.  You can see there is a single Environment named "Public" with two Environment Variables for the OpenAPI and BaseURL endpoints.

    Double-click each Test Suite (i.e., Test Suite or Scenario) in this Test (.tst) File to read the Notes that explain what each example does with some helpful information to orient you along the way.
  tests:
  - $type: TestSuite
    name: /parabank/services/bank/openapi.yaml
    enabled: false
    testID: 1
    notes: |
      This test suite was generated from the OpenAPI service definition of the Parabank Demo Application.
      File > New > Test (.tst) File > REST > OpenAPI/Swagger

      The test suite has been disabled (right-click menu) to avoid running the tests within.  This Test Suite is here as a template to copy/paste individual Test clients into specific Test Suites for testing specific functionality within the Parabank REST API.

      Parabank Demo Application Info:
      Public URL: https://parabank.parasoft.com
      Login: john/demo
      OpenAPI: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
    tests:
    - $type: TestSuite
      name: "/accounts/{accountId}"
      testID: 2
      tests:
      - $type: RESTClientToolTest
        name: "/accounts/{accountId} - GET"
        testID: 3
        performanceGroup: 0
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/accounts/{accountId} - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: root
                bodyType:
                  $type: ComplexType
                  attributes:
                  - ns: ""
                    name: type
                    fixed: object
                    contentType:
                      $type: StringType
                    required: true
                  name: rootType
                  compositor: true
                  compositorObj:
                    $type: AllCompositor
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: ""
                bodyType:
                  $type: ComplexType
                  name: anonymous
                  compositor: true
                  compositorObj:
                    $type: SequenceCompositor
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/accounts/{accountId}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: accounts
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{accountId}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                defaultValue: 0
                localName: accountId
                bodyType:
                  $type: IntegerType
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          resourceMethod:
            resourceId: "/accounts/{accountId}"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/accounts/{accountId}/transactions"
      testID: 4
      tests:
      - $type: RESTClientToolTest
        name: "/accounts/{accountId}/transactions - GET"
        testID: 5
        performanceGroup: 1
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/accounts/{accountId}/transactions - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/accounts/{accountId}/transactions"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: accounts
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{accountId}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: transactions
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :accountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          resourceMethod:
            resourceId: "/accounts/{accountId}/transactions"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/accounts/{accountId}/transactions/amount/{amount}"
      testID: 6
      tests:
      - $type: RESTClientToolTest
        name: "/accounts/{accountId}/transactions/amount/{amount} - GET"
        testID: 7
        performanceGroup: 2
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/accounts/{accountId}/transactions/amount/{amount} - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/accounts/{accountId}/transactions/amount/{amount}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: accounts
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{accountId}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: transactions
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: amount
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{amount}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :accountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                defaultValue: 0.0
                localName: amount
                bodyType:
                  $type: DecimalType
              replacedColumn: ""
              values:
              - $type: DecimalValue
                replacedColumn: ""
                value: 0.0
          resourceMethod:
            resourceId: "/accounts/{accountId}/transactions/amount/{amount}"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/accounts/{accountId}/transactions/fromDate/{fromDate}/toDate/{toDate}"
      testID: 8
      tests:
      - $type: RESTClientToolTest
        name: "/accounts/{accountId}/transactions/fromDate/{fromDate}/toDate/{toDate}\
          \ - GET"
        testID: 9
        performanceGroup: 3
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/accounts/{accountId}/transactions/fromDate/{fromDate}/toDate/{toDate}\
            \ - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/accounts/{accountId}/transactions/fromDate/{fromDate}/toDate/{toDate}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: accounts
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{accountId}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: transactions
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: fromDate
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{fromDate}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: toDate
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{toDate}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :accountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: fromDate
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: toDate
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
          resourceMethod:
            resourceId: "/accounts/{accountId}/transactions/fromDate/{fromDate}/toDate/{toDate}"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/accounts/{accountId}/transactions/month/{month}/type/{type}"
      testID: 10
      tests:
      - $type: RESTClientToolTest
        name: "/accounts/{accountId}/transactions/month/{month}/type/{type} - GET"
        testID: 11
        performanceGroup: 4
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/accounts/{accountId}/transactions/month/{month}/type/{type} - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/accounts/{accountId}/transactions/month/{month}/type/{type}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: accounts
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{accountId}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: transactions
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: month
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{month}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: type
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{type}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :accountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: month
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: type
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
          resourceMethod:
            resourceId: "/accounts/{accountId}/transactions/month/{month}/type/{type}"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/accounts/{accountId}/transactions/onDate/{onDate}"
      testID: 12
      tests:
      - $type: RESTClientToolTest
        name: "/accounts/{accountId}/transactions/onDate/{onDate} - GET"
        testID: 13
        performanceGroup: 5
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/accounts/{accountId}/transactions/onDate/{onDate} - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/accounts/{accountId}/transactions/onDate/{onDate}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: accounts
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{accountId}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: transactions
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: onDate
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{onDate}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :accountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: onDate
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
          resourceMethod:
            resourceId: "/accounts/{accountId}/transactions/onDate/{onDate}"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: /billpay
      testID: 14
      tests:
      - $type: RESTClientToolTest
        name: /billpay - POST
        testID: 15
        performanceGroup: 6
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: /billpay - POST
          formJson:
            builtFromSchema: true
            value:
              $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: root
                bodyType:
                  $type: ComplexType
                  attributes:
                  - ns: ""
                    name: type
                    defaultValue: object
                    fixed: object
                    contentType:
                      $type: StringType
                      _id: 1
                    required: true
                  name: /components/schemas/Payee
                  compositor: true
                  compositorObj:
                    $type: AllCompositor
                    types:
                    - $type: ElementType
                      minOccurs: 0
                      localName: name
                      bodyType:
                        $type: ComplexType
                        _id: 2
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: string
                          fixed: string
                          contentType:
                            $type: StringType
                            _ref: 1
                          required: true
                        content: true
                        contentObj:
                          $type: StringType
                          _ref: 1
                        namespace: urn:parasoft:json
                        name: string
                        compositor: true
                        compositorObj:
                          $type: SequenceCompositor
                    - $type: ElementType
                      minOccurs: 0
                      localName: address
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 1
                          required: true
                        name: /components/schemas/Address
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            minOccurs: 0
                            localName: street
                            bodyType:
                              $type: ComplexType
                              _ref: 2
                          - $type: ElementType
                            minOccurs: 0
                            localName: city
                            bodyType:
                              $type: ComplexType
                              _ref: 2
                          - $type: ElementType
                            minOccurs: 0
                            localName: state
                            bodyType:
                              $type: ComplexType
                              _ref: 2
                          - $type: ElementType
                            minOccurs: 0
                            localName: zipCode
                            bodyType:
                              $type: ComplexType
                              _ref: 2
                    - $type: ElementType
                      minOccurs: 0
                      localName: phoneNumber
                      bodyType:
                        $type: ComplexType
                        _ref: 2
                    - $type: ElementType
                      minOccurs: 0
                      localName: accountNumber
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: number
                          fixed: number
                          contentType:
                            $type: StringType
                            _ref: 1
                          required: true
                        content: true
                        contentObj:
                          $type: IntegerType
                        namespace: urn:parasoft:json
                        name: number
                        compositor: true
                        compositorObj:
                          $type: SequenceCompositor
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
                      values:
                      - $type: ElementValue
                        replacedColumn: ""
                      - $type: ElementValue
                        replacedColumn: ""
                      - $type: ElementValue
                        replacedColumn: ""
                      - $type: ElementValue
                        replacedColumn: ""
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/billpay?accountId=0&amount=0.0"
          urlParameters:
            properties:
            - name: accountId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: amount
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0.0
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: "{}"
              type: application/json
          mode: Form JSON
          literalQuery:
            isPropertiesRef: true
          constrainedQuery:
            parameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :accountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :amount
              replacedColumn: ""
              values:
              - $type: DecimalValue
                replacedColumn: ""
                value: 0.0
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: billpay
          resourceMethod:
            resourceId: /billpay
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: /cleanDB
      testID: 16
      tests:
      - $type: RESTClientToolTest
        name: /cleanDB - POST
        testID: 17
        performanceGroup: 7
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: /cleanDB - POST
          formJson:
            value:
              $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: root
                bodyType:
                  $type: ComplexType
                  attributes:
                  - ns: ""
                    name: type
                    fixed: object
                    contentType:
                      $type: StringType
                    required: true
                  name: rootType
                  compositor: true
                  compositorObj:
                    $type: AllCompositor
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/cleanDB"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: cleanDB
          resourceMethod:
            resourceId: /cleanDB
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: /createAccount
      testID: 18
      tests:
      - $type: RESTClientToolTest
        name: /createAccount - POST
        testID: 19
        performanceGroup: 8
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: /createAccount - POST
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/createAccount?customerId=0&newAccountType=0&fromAccountId=0"
          urlParameters:
            properties:
            - name: customerId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: newAccountType
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: fromAccountId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          constrainedQuery:
            parameters:
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                defaultValue: 0
                localName: customerId
                bodyType:
                  $type: IntegerType
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                defaultValue: 0
                localName: newAccountType
                bodyType:
                  $type: IntegerType
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                defaultValue: 0
                localName: fromAccountId
                bodyType:
                  $type: IntegerType
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: createAccount
          resourceMethod:
            resourceId: /createAccount
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/customers/update/{customerId}"
      testID: 20
      tests:
      - $type: RESTClientToolTest
        name: "/customers/update/{customerId} - POST"
        testID: 21
        performanceGroup: 9
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/customers/update/{customerId} - POST"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/customers/update/{customerId}?firstName=&lastName=&street=&city=&state=&zipCode=&phoneNumber=&ssn=&username=&password="
          urlParameters:
            properties:
            - $type: QueryParameterNameValuePair
              name: firstName
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
            - $type: QueryParameterNameValuePair
              name: lastName
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
            - $type: QueryParameterNameValuePair
              name: street
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
            - $type: QueryParameterNameValuePair
              name: city
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
            - $type: QueryParameterNameValuePair
              name: state
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
            - $type: QueryParameterNameValuePair
              name: zipCode
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
            - $type: QueryParameterNameValuePair
              name: phoneNumber
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
            - $type: QueryParameterNameValuePair
              name: ssn
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
            - $type: QueryParameterNameValuePair
              name: username
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
            - $type: QueryParameterNameValuePair
              name: password
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          constrainedQuery:
            parameters:
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: firstName
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: lastName
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: street
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: city
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: state
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: zipCode
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: phoneNumber
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: ssn
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: username
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: password
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: customers
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: update
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{customerId}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :customerId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          resourceMethod:
            resourceId: "/customers/update/{customerId}"
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/customers/{customerId}"
      testID: 22
      tests:
      - $type: RESTClientToolTest
        name: "/customers/{customerId} - GET"
        testID: 23
        performanceGroup: 10
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/customers/{customerId} - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/customers/{customerId}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: customers
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{customerId}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :customerId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          resourceMethod:
            resourceId: "/customers/{customerId}"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/customers/{customerId}/accounts"
      testID: 24
      tests:
      - $type: RESTClientToolTest
        name: "/customers/{customerId}/accounts - GET"
        testID: 25
        performanceGroup: 11
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/customers/{customerId}/accounts - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/customers/{customerId}/accounts"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: customers
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{customerId}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: accounts
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :customerId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          resourceMethod:
            resourceId: "/customers/{customerId}/accounts"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/customers/{customerId}/buyPosition"
      testID: 26
      tests:
      - $type: RESTClientToolTest
        name: "/customers/{customerId}/buyPosition - POST"
        testID: 27
        performanceGroup: 12
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/customers/{customerId}/buyPosition - POST"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/customers/{customerId}/buyPosition?accountId=0&name=&symbol=&shares=0&pricePerShare=0.0"
          urlParameters:
            properties:
            - name: accountId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - $type: QueryParameterNameValuePair
              name: name
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
            - $type: QueryParameterNameValuePair
              name: symbol
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
              hasEqualsForEmptyValue: true
            - name: shares
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: pricePerShare
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0.0
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          constrainedQuery:
            parameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :accountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: name
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: symbol
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                defaultValue: 0
                localName: shares
                bodyType:
                  $type: IntegerType
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                defaultValue: 0.0
                localName: pricePerShare
                bodyType:
                  $type: DecimalType
              replacedColumn: ""
              values:
              - $type: DecimalValue
                replacedColumn: ""
                value: 0.0
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: customers
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{customerId}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: buyPosition
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :customerId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          resourceMethod:
            resourceId: "/customers/{customerId}/buyPosition"
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/customers/{customerId}/positions"
      testID: 28
      tests:
      - $type: RESTClientToolTest
        name: "/customers/{customerId}/positions - GET"
        testID: 29
        performanceGroup: 13
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/customers/{customerId}/positions - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/customers/{customerId}/positions"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: customers
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{customerId}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: positions
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :customerId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          resourceMethod:
            resourceId: "/customers/{customerId}/positions"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/customers/{customerId}/sellPosition"
      testID: 30
      tests:
      - $type: RESTClientToolTest
        name: "/customers/{customerId}/sellPosition - POST"
        testID: 31
        performanceGroup: 14
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/customers/{customerId}/sellPosition - POST"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/customers/{customerId}/sellPosition?accountId=0&positionId=0&shares=0&pricePerShare=0.0"
          urlParameters:
            properties:
            - name: accountId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: positionId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: shares
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: pricePerShare
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0.0
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          constrainedQuery:
            parameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :accountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                defaultValue: 0
                localName: positionId
                bodyType:
                  $type: IntegerType
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :shares
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :pricePerShare
              replacedColumn: ""
              values:
              - $type: DecimalValue
                replacedColumn: ""
                value: 0.0
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: customers
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{customerId}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: sellPosition
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :customerId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          resourceMethod:
            resourceId: "/customers/{customerId}/sellPosition"
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: /deposit
      testID: 32
      tests:
      - $type: RESTClientToolTest
        name: /deposit - POST
        testID: 33
        performanceGroup: 15
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: /deposit - POST
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/deposit?accountId=0&amount=0.0"
          urlParameters:
            properties:
            - name: accountId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: amount
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0.0
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          constrainedQuery:
            parameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :accountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :amount
              replacedColumn: ""
              values:
              - $type: DecimalValue
                replacedColumn: ""
                value: 0.0
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: deposit
          resourceMethod:
            resourceId: /deposit
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: /initializeDB
      testID: 34
      tests:
      - $type: RESTClientToolTest
        name: /initializeDB - POST
        testID: 35
        performanceGroup: 16
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: /initializeDB - POST
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/initializeDB"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: initializeDB
          resourceMethod:
            resourceId: /initializeDB
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/login/{username}/{password}"
      testID: 36
      tests:
      - $type: RESTClientToolTest
        name: "/login/{username}/{password} - GET"
        testID: 37
        performanceGroup: 17
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/login/{username}/{password} - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/login/{username}/{password}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: login
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{username}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{password}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :username
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :password
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
          resourceMethod:
            resourceId: "/login/{username}/{password}"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/positions/{positionId}"
      testID: 38
      tests:
      - $type: RESTClientToolTest
        name: "/positions/{positionId} - GET"
        testID: 39
        performanceGroup: 18
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/positions/{positionId} - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/positions/{positionId}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: positions
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{positionId}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :positionId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          resourceMethod:
            resourceId: "/positions/{positionId}"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/positions/{positionId}/{startDate}/{endDate}"
      testID: 40
      tests:
      - $type: RESTClientToolTest
        name: "/positions/{positionId}/{startDate}/{endDate} - GET"
        testID: 41
        performanceGroup: 19
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/positions/{positionId}/{startDate}/{endDate} - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/positions/{positionId}/{startDate}/{endDate}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: positions
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{positionId}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{startDate}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{endDate}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :positionId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: startDate
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: endDate
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
          resourceMethod:
            resourceId: "/positions/{positionId}/{startDate}/{endDate}"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: /requestLoan
      testID: 42
      tests:
      - $type: RESTClientToolTest
        name: /requestLoan - POST
        testID: 43
        performanceGroup: 20
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: /requestLoan - POST
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/requestLoan?customerId=0&amount=0.0&downPayment=0.0&fromAccountId=0"
          urlParameters:
            properties:
            - name: customerId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: amount
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0.0
            - name: downPayment
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0.0
            - name: fromAccountId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          constrainedQuery:
            parameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :customerId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :amount
              replacedColumn: ""
              values:
              - $type: DecimalValue
                replacedColumn: ""
                value: 0.0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                defaultValue: 0.0
                localName: downPayment
                bodyType:
                  $type: DecimalType
              replacedColumn: ""
              values:
              - $type: DecimalValue
                replacedColumn: ""
                value: 0.0
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :fromAccountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: requestLoan
          resourceMethod:
            resourceId: /requestLoan
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/setParameter/{name}/{value}"
      testID: 44
      tests:
      - $type: RESTClientToolTest
        name: "/setParameter/{name}/{value} - POST"
        testID: 45
        performanceGroup: 21
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/setParameter/{name}/{value} - POST"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/setParameter/{name}/{value}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: setParameter
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{name}"
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{value}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :name
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: value
                bodyType:
                  $type: StringType
              replacedColumn: ""
              values:
              - $type: StringValue
                replacedColumn: ""
                value: ""
          resourceMethod:
            resourceId: "/setParameter/{name}/{value}"
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: /shutdownJmsListener
      testID: 46
      tests:
      - $type: RESTClientToolTest
        name: /shutdownJmsListener - POST
        testID: 47
        performanceGroup: 22
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: /shutdownJmsListener - POST
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/shutdownJmsListener"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: shutdownJmsListener
          resourceMethod:
            resourceId: /shutdownJmsListener
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: /startupJmsListener
      testID: 48
      tests:
      - $type: RESTClientToolTest
        name: /startupJmsListener - POST
        testID: 49
        performanceGroup: 23
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: /startupJmsListener - POST
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/startupJmsListener"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: startupJmsListener
          resourceMethod:
            resourceId: /startupJmsListener
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: "/transactions/{transactionId}"
      testID: 50
      tests:
      - $type: RESTClientToolTest
        name: "/transactions/{transactionId} - GET"
        testID: 51
        performanceGroup: 24
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: "/transactions/{transactionId} - GET"
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/transactions/{transactionId}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: transactions
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{transactionId}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                defaultValue: 0
                localName: transactionId
                bodyType:
                  $type: IntegerType
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
          resourceMethod:
            resourceId: "/transactions/{transactionId}"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: /transfer
      testID: 52
      tests:
      - $type: RESTClientToolTest
        name: /transfer - POST
        testID: 53
        performanceGroup: 25
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: /transfer - POST
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/transfer?fromAccountId=0&toAccountId=0&amount=0.0"
          urlParameters:
            properties:
            - name: fromAccountId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: toAccountId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: amount
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0.0
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          constrainedQuery:
            parameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :fromAccountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                defaultValue: 0
                localName: toAccountId
                bodyType:
                  $type: IntegerType
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :amount
              replacedColumn: ""
              values:
              - $type: DecimalValue
                replacedColumn: ""
                value: 0.0
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: transfer
          resourceMethod:
            resourceId: /transfer
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
    - $type: TestSuite
      name: /withdraw
      testID: 54
      tests:
      - $type: RESTClientToolTest
        name: /withdraw - POST
        testID: 55
        performanceGroup: 26
        tool:
          $type: RESTClient
          iconName: RESTClient
          name: /withdraw - POST
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          xmlBuilder: false
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/withdraw?accountId=0&amount=0.0"
          urlParameters:
            properties:
            - name: accountId
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0
            - name: amount
              value:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  value: 0.0
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          constrainedQuery:
            parameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :accountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                replacedColumn: ""
                value: 0
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :amount
              replacedColumn: ""
              values:
              - $type: DecimalValue
                replacedColumn: ""
                value: 0.0
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: withdraw
          resourceMethod:
            resourceId: /withdraw
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
  - $type: TestSuite
    name: 2.0.1 - Sequencing Multiple API Calls Together
    testID: 56
    notes: |-
      Here you can see the Test Suite has been renamed by SOAtest to Scenario.  This indicates that the Tests within the Test Suite have a dependency to each other, meaning they are not meant to be run in isolation but as a group.

      Notice Test 1 sends a username and password as inputs to a /login resource, and Test 2 sends a customerId input to a /customers resource.  This Scenario demonstrates how to dynamically extract the customerId from the response payload of Test 1, and parameterize the request parameter in Test 2 with it.

      Expand Test 1 and open the JSON Data Bank Tool.

      JSON (and XML) Data Bank Tools are similar to the Assertor in the sense that they allow you to select data from a structured payload like JSON, except instead of performing an assertion that data is stored in a variable that be referenced in a subsequent test step.

      Open Test 2 and notice that the customerId parameter has been parameterized to the name of the variable defined in the JSON Data Bank that is chained to the Response Traffic output of Test 1.

      Select the Scenario node and run the Tests.  You can see for yourself by checking the Traffic Viewers chained to Tests 1 & 2 that the customerId field from the response of Test 1 was used in the request of Test 2.  Furthermore, you can use the following alternate login credentials to see that a different customerId is returned and used in Test 2: parasoft/demo

      Troubleshooting:
      * If a Test fails with a response like "Could not login": Go to http://parabank.parasoft.com/ in a web browser, click the Admin Page link, click the Database > Initialize button, then try again.
      * If a Test fails with no response, check that you have network access to the public site http://parabank.parasoft.com.
    tests:
    - $type: RESTClientToolTest
      name: "/login/{username}/{password} - GET"
      testID: 58
      performanceGroup: 17
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: "/login/{username}/{password} - GET"
        outputTools:
        - $type: GenericDataBank
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/id[1]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - customName: "Test 1: id[1]"
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/login/{username}/{password}"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: login
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{username}"
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{password}"
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :username
            replacedColumn: ""
            values:
            - $type: StringValue
              replacedColumn: ""
              value: parasoft
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :password
            replacedColumn: ""
            values:
            - $type: StringValue
              replacedColumn: ""
              value: demo
        resourceMethod:
          resourceId: "/login/{username}/{password}"
          httpMethod: GET
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
    - $type: RESTClientToolTest
      name: "/customers/{customerId} - GET"
      testID: 59
      performanceGroup: 10
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: "/customers/{customerId} - GET"
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/customers/{customerId}"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Test 1: id[1]"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: customers
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{customerId}"
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :customerId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              mode: 3
              columnName: "Test 1: id[1]"
              value: 0
        resourceMethod:
          resourceId: "/customers/{customerId}"
          httpMethod: GET
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
  - $type: TestSuite
    name: 2.1.1 - Sequencing Multiple API Calls Together - With Validation - Diff
    testID: 60
    notes: |
      Here, you'll notice the same Scenario like in the previous example, except the Data Bank chained to Test 1 has an additional extraction and there is a Diff Tool chained to Test 2.

      Notice that the response for the login resource is identical to the response from the /customers/{customerId} resource.  For a situation like this, you might want to compare the payloads and combining the functionality of the Data Bank with the Diff Tool is exactly how to automate that check.

      The Data Bank extraction was done by clicking the root node in the Tree view.

      The Diff Tool in Test 2 was created like in the previous example shown in 1.1.1, except after it was created, the Regression Control Source was changed to Data Source and the Data Bank column from Test 1's Data Bank was selected.
    tests:
    - $type: RESTClientToolTest
      name: "/login/{username}/{password} - GET"
      testID: 61
      performanceGroup: 17
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: "/login/{username}/{password} - GET"
        outputTools:
        - $type: GenericDataBank
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/id[1]/text()"
              mode: 1
            - elementOption: 1
              contentOption: 2
              XMLDataBank_ExtractXPath: /root
              target: 1
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - customName: "Test 1: id[1]"
              - customName: "Test 1: root"
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/login/{username}/{password}"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Test 1: id[1]"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: login
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{username}"
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{password}"
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :username
            replacedColumn: ""
            values:
            - $type: StringValue
              replacedColumn: ""
              value: john
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :password
            replacedColumn: ""
            values:
            - $type: StringValue
              replacedColumn: ""
              value: demo
        resourceMethod:
          resourceId: "/login/{username}/{password}"
          httpMethod: GET
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
    - $type: RESTClientToolTest
      name: "/customers/{customerId} - GET"
      testID: 62
      performanceGroup: 10
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: "/customers/{customerId} - GET"
        outputTools:
        - $type: DiffTool
          iconName: Diff
          name: "Diff control generated on Nov 14, 2025, 1:14:58 PM."
          differs:
          - $type: JSONDiffer
          source:
            optionsSource: 3
            dataSourceColumn: "Test 1: root"
          mode: 3
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          serviceName: ""
          versionName: ""
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/customers/{customerId}"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Test 1: id[1]"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: customers
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{customerId}"
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :customerId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              mode: 3
              columnName: "Test 1: id[1]"
              value: 0
        resourceMethod:
          resourceId: "/customers/{customerId}"
          httpMethod: GET
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
  - $type: TestSuite
    name: 2.1.2 - Sequencing Multiple API Calls Together - With Validation - Assertor
    testID: 63
    notes: "Here, you'll notice a different Scenario than the previous example.  Here,\
      \ there are 3 REST Clients that:\n1: Retrieve account details for accountId\n\
      2. Make a deposit into an account\n3. Retrieve account details for accountId\n\
      \nThis Scenario covers a typical API testing use case where one wants to compare\
      \ a before & after state of the application (e.g., account balance) when performing\
      \ an operation (e.g., deposit).  \n\nNotice all of the inputs in the REST Clients\
      \ are hard coded to fixed values for now, while we focus on the data comparison\
      \ login between test steps.\n\nOpen the JSON Data Bank Tool chained to Test\
      \ 1.  Here we can see the Account Balance is being extracted into a variable\
      \ to be used later.\n\nOpen the JSON Assertor Tool chained to Test 3.  Here\
      \ we can see a Numeric Difference Assertion is being used.  This Assertion does\
      \ something pretty neat.  It compares the balance of the response it receives\
      \ against some baseline balance and by how much it should be different.  You\
      \ can change the Difference Value to see what it looks like when the assertion\
      \ fails.\n"
    tests:
    - $type: RESTClientToolTest
      name: "/accounts/{accountId} - GET"
      testID: 64
      performanceGroup: 0
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: "/accounts/{accountId} - GET"
        outputTools:
        - $type: GenericDataBank
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/balance[1]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - customName: "Test 1: balance[1]"
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/accounts/{accountId}"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Test 1: id[1]"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: accounts
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{accountId}"
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :accountId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              value: 54321
        resourceMethod:
          resourceId: "/accounts/{accountId}"
          httpMethod: GET
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
    - $type: RESTClientToolTest
      name: /deposit - POST
      testID: 65
      performanceGroup: 15
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: /deposit - POST
        outputTools:
        - $type: DiffTool
          iconName: Diff
          name: "Diff control generated on Nov 14, 2025, 1:30:13 PM."
          differs:
          - $type: TextDiffer
          source:
            controls:
            - keys:
              - ""
              - ""
              row:
                refs:
                - dataSourceName: ""
                last: false
            - "Successfully deposited $1.0 to account #54321"
          mode: 1
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/deposit?accountId=0&amount=0.0"
        urlParameters:
          properties:
          - name: accountId
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: 0
          - name: amount
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: 0.0
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Test 1: id[1]"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        constrainedQuery:
          parameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :accountId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              value: 54321
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :amount
            replacedColumn: ""
            values:
            - $type: DecimalValue
              replacedColumn: ""
              value: 1.0
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: deposit
        resourceMethod:
          resourceId: /deposit
          httpMethod: POST
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
    - $type: RESTClientToolTest
      name: "/accounts/{accountId} - GET 2"
      testID: 66
      performanceGroup: 0
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: "/accounts/{accountId} - GET 2"
        outputTools:
        - $type: GenericAssertionTool
          iconName: XMLAssertor
          name: JSON Assertor
          wrappedTool:
            $type: XMLAssertionTool
            iconName: XMLAssertor
            name: XML Assertor
            assertions:
            - $type: DifferenceAssertion
              timestamp: 1763155834651
              name: Numeric Difference Assertion
              Assertion_XPath: /root/balance
              data:
                $type: NumericDifference
                values:
                - Difference Value
                - name: Difference Value
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: 1
                base:
                  name: Base Value
                  value:
                    fixedValue:
                      $type: StringTestValue
                    parameterizedValue:
                      column: "Test 1: balance[1]"
                    selectedIndex: -2
            message:
              $type: ExpectedXMLMessage
              message: true
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/accounts/{accountId}"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Test 1: id[1]"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: accounts
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{accountId}"
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :accountId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              value: 54321
        resourceMethod:
          resourceId: "/accounts/{accountId}"
          httpMethod: GET
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
  - $type: TestSuite
    name: 2.1.3 - Data Driven Scenario - With Validation - Assertor
    testID: 67
    notes: "Here, you'll notice the same Scenario like the previous example, except\
      \ now we have a Table Data Source added in.\n\nOpen each REST Client to see\
      \ that the inputs have been parameterized to the accountId and deposit columns\
      \ of the Data Source.\n\nOpen the JSON Assertor chained to Test 3, and see that\
      \ the Numeric Difference Assertion has been updated so that the Difference Value\
      \ is parameterized to the deposit column of the Data Source as well.\n\nNote\
      \ that the dynamically extracted balance from Test 1 is the same as in the previous\
      \ example.  That data is not coming from the Data Source but is rather extracted\
      \ at runtime to accomplish the comparison of balance before & after the deposit.\n\
      \nOpen the Traffic Viewer Tools chained to each REST Client and see the traffic\
      \ for each Data Source row is reflected there for manual inspection.  \n\nAlso\
      \ note that SOAtest reports 9/9 Tests Succeeded.  There are 3 REST Clients in\
      \ this Scenario, and 3 rows in the Data Source, so 9 Tests in total were run.\n"
    dataSources:
    - id: ds_1986284792_1763156156836_72446054
      impl:
        $type: TableDataSource
        model:
          columnIdentifiers:
          - accountId
          - deposit
          rows:
          - - 54321
            - 1
          - - 13344
            - 4
          - - 13233
            - 6
      name: Test Data 2-1-3
      useAllRows: true
    tests:
    - $type: RESTClientToolTest
      name: "/accounts/{accountId} - GET"
      testID: 68
      performanceGroup: 0
      tool:
        $type: RESTClient
        dataSourceNames:
        - Test Data 2-1-3
        iconName: RESTClient
        name: "/accounts/{accountId} - GET"
        outputTools:
        - $type: GenericDataBank
          dataSourceNames:
          - Test Data 2-1-3
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            dataSourceNames:
            - Test Data 2-1-3
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/balance[1]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - customName: "Test 1: balance[1]"
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/accounts/{accountId}"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Test 1: id[1]"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: accounts
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{accountId}"
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :accountId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              mode: 3
              columnName: accountId
              value: 54321
        resourceMethod:
          resourceId: "/accounts/{accountId}"
          httpMethod: GET
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
    - $type: RESTClientToolTest
      name: /deposit - POST
      testID: 69
      performanceGroup: 15
      tool:
        $type: RESTClient
        dataSourceNames:
        - Test Data 2-1-3
        iconName: RESTClient
        name: /deposit - POST
        outputTools:
        - $type: DiffTool
          dataSourceNames:
          - Test Data 2-1-3
          iconName: Diff
          name: "Diff control generated on Nov 14, 2025, 1:38:25 PM."
          differs:
          - $type: TextDiffer
          source:
            controls:
            - keys:
              - ""
              - ""
              - accountId
              - 54321
              - deposit
              - 1
              row:
                refs:
                - dataSourceName: Test Data 2-1-3
                  row: 1
                last: false
            - "Successfully deposited $1 to account #54321"
            - keys:
              - ""
              - ""
              - accountId
              - 13344
              - deposit
              - 4
              row:
                refs:
                - first: false
                  dataSourceName: Test Data 2-1-3
                  row: 2
                first: false
                last: false
            - "Successfully deposited $4 to account #13344"
            - keys:
              - ""
              - ""
              - accountId
              - 13233
              - deposit
              - 6
              row:
                refs:
                - first: false
                  last: true
                  dataSourceName: Test Data 2-1-3
                  row: 3
                first: false
            - "Successfully deposited $6 to account #13233"
            optionsType: 2
          mode: 1
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/deposit?accountId=0&amount=0.0"
        urlParameters:
          properties:
          - name: accountId
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: 0
          - name: amount
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: 0.0
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Test 1: id[1]"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        constrainedQuery:
          parameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :accountId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              mode: 3
              columnName: accountId
              value: 54321
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :amount
            replacedColumn: ""
            values:
            - $type: DecimalValue
              replacedColumn: ""
              mode: 3
              columnName: deposit
              value: 1.0
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: deposit
        resourceMethod:
          resourceId: /deposit
          httpMethod: POST
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
    - $type: RESTClientToolTest
      name: "/accounts/{accountId} - GET 2"
      testID: 70
      performanceGroup: 0
      tool:
        $type: RESTClient
        dataSourceNames:
        - Test Data 2-1-3
        iconName: RESTClient
        name: "/accounts/{accountId} - GET 2"
        outputTools:
        - $type: GenericAssertionTool
          dataSourceNames:
          - Test Data 2-1-3
          iconName: XMLAssertor
          name: JSON Assertor
          wrappedTool:
            $type: XMLAssertionTool
            dataSourceNames:
            - Test Data 2-1-3
            iconName: XMLAssertor
            name: XML Assertor
            assertions:
            - $type: DifferenceAssertion
              timestamp: 1763155834651
              name: Numeric Difference Assertion
              Assertion_XPath: /root/balance
              data:
                $type: NumericDifference
                values:
                - Difference Value
                - name: Difference Value
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: 1
                    parameterizedValue:
                      column: deposit
                    selectedIndex: -2
                base:
                  name: Base Value
                  value:
                    fixedValue:
                      $type: StringTestValue
                    parameterizedValue:
                      column: "Test 1: balance[1]"
                    selectedIndex: -2
            message:
              $type: ExpectedXMLMessage
              message: true
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/accounts/{accountId}"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Test 1: id[1]"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: accounts
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{accountId}"
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :accountId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              mode: 3
              columnName: accountId
              value: 54321
        resourceMethod:
          resourceId: "/accounts/{accountId}"
          httpMethod: GET
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
  - $type: TestSuite
    name: 2.2.1 - Iterate Over Response List - With Validation - Assertor
    testID: 77
    notes: |-
      Here is an example of an advanced scenario that extracts a list from one API response, and then iterates over the data from that list in a subsequent API call that's looping over a dynamically generated Data Source.

      First, open the Writable Data Source in this Scenario.  This is a special kind of Data Source that is meant to be populated at runtime with 1-n rows of data, with the intent that subsequent Tests will be parameterized to these columns for looping.

      Notice Test 1 is the same REST Client from the 1.1.2 example.  The API response is a list of accounts associated with a particular customerId.

      Notice the JSON Data Bank chained to Test 1.  There are two differences with how the extractions in this JSON Data Bank are configured compared to previous examples you've seen.
      1) Each Extraction is adding an XPath for all occurences of an element, not just the first occurence.  Right-click on a node in the Tree view to see the option that was used to make the extraction.  Inspecting the existing extractions will also show you the XPath that is selecting multiple nodes, which can be Evaluated in the same window.
      2) Each Extraction is configured to populate a column in the Writable Data Source, rather than storing the data in a Custom Column Name.

      Next, open the nested Scenario "Dynamically Loop Accounts".  For the looping to work as intended, the Execution Options were modified so that Tests would run as a group.

      Finally, open the REST Client and its chained JSON Assertor within the nested looping Scenario.  Notice both are configured to iterate over the Writable Data Source's columns.

      Select Scenario 2.2.1 and run the Scenario.  Notice that 12 Tests are executed, one for retrieving the customer's account, and eleven because there are fifteen accounts associated with this customerId.
      The Traffic Viewer chained to the REST Client within the nested looping Scenario shows the Request/Response traffic for each row of the Writable Data Source.
    dataSources:
    - id: ds_1986284823_1763162604303_1729567509
      impl:
        $type: WritableDataSource
        model:
          columnCount: 2
          columnIdentifiers:
          - accountId
          - accountBalance
          rows:
          - - 12345
            - -2300.00
          - - 12456
            - 10.45
          - - 12567
            - 100.00
          - - 12678
            - -100.00
          - - 12789
            - 100.00
          - - 12900
            - 0.00
          - - 13011
            - 100.00
          - - 13122
            - 1100.00
          - - 13233
            - 100.00
          - - 13344
            - 1231.10
          - - 54321
            - 1351.12
        resetMode: 2
        writingMode: 3
      name: Dynamic Data 2-2-1
      useAllRows: true
    tests:
    - $type: RESTClientToolTest
      name: "/customers/{customerId}/accounts - GET"
      testID: 78
      performanceGroup: 11
      tool:
        $type: RESTClient
        dataSourceNames:
        - Dynamic Data 2-2-1
        iconName: RESTClient
        name: "/customers/{customerId}/accounts - GET"
        outputTools:
        - $type: GenericDataBank
          dataSourceNames:
          - Dynamic Data 2-2-1
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            dataSourceNames:
            - Dynamic Data 2-2-1
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/item/id[1]/text()"
              mode: 1
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/item/balance[1]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - dataSourceNames:
                - "Dynamic Data 2-2-1: accountId"
                mode: 2
                customName: "Test 1: id"
              - dataSourceNames:
                - "Dynamic Data 2-2-1: accountBalance"
                mode: 2
                customName: "Test 1: balance"
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          serviceName: ""
          versionName: ""
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/customers/{customerId}/accounts"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: customers
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{customerId}"
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: accounts
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :customerId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              value: 12212
        resourceMethod:
          resourceId: "/customers/{customerId}/accounts"
          httpMethod: GET
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
    - $type: TestSuite
      name: Dynamically Loop Accounts
      testID: 79
      runMode: 1
      tests:
      - $type: RESTClientToolTest
        name: "/accounts/{accountId} - GET"
        testID: 80
        performanceGroup: 0
        tool:
          $type: RESTClient
          dataSourceNames:
          - Dynamic Data 2-2-1
          iconName: RESTClient
          name: "/accounts/{accountId} - GET"
          outputTools:
          - $type: GenericAssertionTool
            dataSourceNames:
            - Dynamic Data 2-2-1
            iconName: XMLAssertor
            name: JSON Assertor
            wrappedTool:
              $type: XMLAssertionTool
              dataSourceNames:
              - Dynamic Data 2-2-1
              iconName: XMLAssertor
              name: XML Assertor
              assertions:
              - $type: NumericAssertion
                timestamp: 1763162791730
                name: Numeric Assertion
                Assertion_XPath: /root/balance
                value:
                  name: Numeric
                  value:
                    fixedValue:
                      $type: StringTestValue
                    parameterizedValue:
                      column: "Dynamic Data 2-2-1: accountBalance"
                    selectedIndex: -2
              message:
                $type: ExpectedXMLMessage
                message: true
            conversionStrategy:
              dataFormatName: JSON
              conversionStrategyId: JSON
              conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          schemaURL:
            MessagingClient_SchemaLocation: "${OPENAPI}"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          validResponseRange:
            validResponseRange:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                validResponseRange: 200
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: "${BASEURL}/accounts/{accountId}"
          transportProperties:
            manager:
              protocol: 1
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    properties:
                    - name: Accept
                      value:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          value: application/json
                protocol: 1
                keepAlive1_1:
                  bool: true
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
              name: Traffic Object
          formXML:
            doctype: ""
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: ""
              type: application/json
            dataSource:
              columnName: "Test 1: id[1]"
          mode: Literal
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: accounts
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: "{accountId}"
          constrainedPath:
            pathParameters:
            - $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :accountId
              replacedColumn: ""
              values:
              - $type: IntegerValue
                hasMethod: true
                replacedColumn: ""
                mode: 3
                columnName: "Dynamic Data 2-2-1: accountId"
                value: 54321
          resourceMethod:
            resourceId: "/accounts/{accountId}"
            httpMethod: GET
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: https://parabank.parasoft.com/parabank/services/bank
            fixedValue:
              $type: StringTestValue
              value: "${BASEURL}"
  - $type: TestSuite
    name: "Util: Reset Parabank Database"
    testID: 71
    notes: Some of the operations performed by the Tests in this Test (.tst) File
      alter the data of Parabank.  Running this Test Suite will re-initialize the
      Parabank database back to its starting state.
    tests:
    - $type: RESTClientToolTest
      name: /initializeDB - POST
      testID: 72
      performanceGroup: 16
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: /initializeDB - POST
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: https://parabank.parasoft.com/parabank/services/bank/openapi.yaml
          serviceName: ""
          versionName: ""
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${OPENAPI}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 204
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/initializeDB"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: initializeDB
        resourceMethod:
          resourceId: /initializeDB
          httpMethod: POST
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
