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

    Double-click each Test Suite in this Test (.tst) File to read the Notes that explain what each example does with some helpful information to orient you along the way.
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
    name: "Util: Reset Parabank Database"
    testID: 83
    notes: |-
      Some of the operations performed by the Tests in this Test (.tst) File alter the data of Parabank.  Running this Test Suite will re-initialize the Parabank database back to its starting state.

      Run the Test, select either this Test Suite, or "Test 1: /initializeDB - POST" within, and click the Blue play button on the top toolbar.  You can also use F9 as they keyboard shortcut for running a Test.
      On the bottom right, you will see the Test Progress view that shows 1/1 Tests Succeeded.
      On the bottom left, you will see a Quality Tasks view that will show any test failures that arise.
      On the bottom left, you will see a Console view that will show more test execution details.
    tests:
    - $type: RESTClientToolTest
      name: /initializeDB - POST
      testID: 84
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
  - $type: TestSuite
    name: 1.0.1 - Basic REST Client (GET)
    testID: 56
    notes: |-
      Here you can see a REST Client for a specific resource in the Parabank REST API that was copy/pasted from the template above.  Double-click "Test 1: /accounts/{accountId} - GET" to open the REST Client editor.

      REST Client Tabs > Resource: A convenient GUI that lets you configure the HTTP request that will get made when you run the Test.
      REST Client Tabs > Payload: Request payloads are defined here.  Since this is a GET request, the Payload tab is disabled.  We will see an example of a POST request later.
      REST Client Tabs > HTTP Options: This tab is where you can configure additional settings like Authentication or custom HTTP Headers.  We'll come back to Authentication further down in this Test (.tst) File.
      REST Client Tabs > Misc: Here are some miscellaneous settings, including the default response validation for Valid HTTP Response Codes.  You can change this setting to see the Test fail when you run it.

      Run the Test.  After the Test runs, expand the Test node and double-click the Traffic Viewer Tool that is chained to the REST Client's Traffic Object output.  This is where you can see the Request/Response details of the test run.

      SOAtest Tests are based on the concept of Tools.  The REST Client is a Tool, and the Traffic Viewer is a Tool.  Some Tools are meant to be standalone (i.e., Tests in a Test Suite) and other Tools are meant to be chained to a standalone Tool's output.
      * To see the list of standalone tools, right click this Test Suite > Add New > Test.  Review the list of available standalone Tools that can be added to a SOAtest Test (.tst) File.
      * To see the list of chainable tools for a REST Client, right click the REST Client "Test 1: /accounts/{accountId} - GET" > Add Output.  You will notice that the REST Client has a number of outputs grouped into Response, Request, and Both.  Most of the time, you will be chaining Tools to a REST Client's Response Transport Header or Response Traffic output.  We will cover the most common Tools that get chained to a REST Client further down in this Test (.tst) File.

      Troubleshooting:
      * If a Test fails with a response like "Could not find account #12345": Go to http://parabank.parasoft.com/ in a web browser, click the Admin Page link, click the Database > Initialize button, then try again.
      * If a Test fails with no response, check that you have network access to the public site http://parabank.parasoft.com.
    tests:
    - $type: RESTClientToolTest
      name: "/accounts/{accountId} - GET"
      testID: 57
      performanceGroup: 0
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: "/accounts/{accountId} - GET"
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
            hasReference: true
            qnameAsString: :accountId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              value: 12345
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
    name: 1.0.2 - Basic REST Client (POST)
    testID: 71
    notes: |-
      Here, you'll notice a different REST Client than the previous example.  This REST Client is working with a /billpay resource that expects a POST request with a JSON payload in the body.

      The Payload tab is configured for JSON as the format, but other formats like XML are also supported.

      By default, the REST Client uses the Form JSON input mode.  You can switch this to Literal mode if you prefer to work with the payload as text.  Paramerization is supported with ${} syntax.  After switching from the Form JSON mode to Literal mode, there is also a right-click context menu to beautify the JSON into multiple lines.  It is also possible to interchange between Literal and Form JSON modes whenever you want.
    tests:
    - $type: RESTClientToolTest
      name: /billpay - POST
      testID: 72
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
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        allowArrayExclude: true
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: string
                          useValue: true
                        contentValue: true
                        contentValueObj:
                          $type: StringValue
                          replacedColumn: ""
                          value: Parasoft Corporation
                        compositorValue: true
                        compositorValueObj:
                          replacedColumn: ""
                          values:
                            $type: CompositorValueSetCollectionSet
                            set:
                            - $type: CompositorValueSet
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        allowArrayExclude: true
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
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  allowArrayExclude: true
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: string
                                    useValue: true
                                  contentValue: true
                                  contentValueObj:
                                    $type: StringValue
                                    replacedColumn: ""
                                    value: 101 E. Huntington Drive
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  allowArrayExclude: true
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: string
                                    useValue: true
                                  contentValue: true
                                  contentValueObj:
                                    $type: StringValue
                                    replacedColumn: ""
                                    value: Monrovia
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  allowArrayExclude: true
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: string
                                    useValue: true
                                  contentValue: true
                                  contentValueObj:
                                    $type: StringValue
                                    replacedColumn: ""
                                    value: CA
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  allowArrayExclude: true
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: string
                                    useValue: true
                                  contentValue: true
                                  contentValueObj:
                                    $type: StringValue
                                    replacedColumn: ""
                                    value: 91016
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        allowArrayExclude: true
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: string
                          useValue: true
                        contentValue: true
                        contentValueObj:
                          $type: StringValue
                          replacedColumn: ""
                          value: 1-888-305-0041
                        compositorValue: true
                        compositorValueObj:
                          replacedColumn: ""
                          values:
                            $type: CompositorValueSetCollectionSet
                            set:
                            - $type: CompositorValueSet
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        allowArrayExclude: true
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: number
                          useValue: true
                        contentValue: true
                        contentValueObj:
                          $type: IntegerValue
                          replacedColumn: ""
                          value: 12345
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
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: |-
              {
                  "name" : "Parasoft Corporation",
                  "address" : {
                      "street" : "101 E. Huntington Drive",
                      "city" : "Monrovia",
                      "state" : "CA",
                      "zipCode" : "91016"
                  },
                  "phoneNumber" : "1-888-305-0041",
                  "accountNumber" : 12345
              }
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
              value: 12345
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
    name: 1.0.3 - Basic REST Client (No Service Definition)
    testID: 75
    notes: |-
      Here, you'll notice the same REST Client like the previous example, except now the REST Client's Service Definition setting is set to None.

      Compare this REST Client to the one from 1.0.2 to see the differences.  When a REST Client is set to a service definition, some aspects of its configuration are conforming to that service definition and become selectable options rather than free text fields.  In this example, the Resource definition of the REST Client is fully configurable, since there is no service definition that defines what the various resources and schemas are.

      It is a best practice to tie API test clients to a service definition when testing in SOAtest.  Besides the ease of use features in test client setup, SOAtest also provides some nice "API Coverage" reporting for test clients tied to a service definition as well as bulk refactoring support when a service definition changes with its Change Advisor feature.
    tests:
    - $type: RESTClientToolTest
      name: /billpay - POST
      testID: 76
      performanceGroup: 6
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: /billpay - POST
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
                    values:
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        allowArrayExclude: true
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: string
                          useValue: true
                        contentValue: true
                        contentValueObj:
                          $type: StringValue
                          replacedColumn: ""
                          value: Parasoft Corporation
                        compositorValue: true
                        compositorValueObj:
                          replacedColumn: ""
                          values:
                            $type: CompositorValueSetCollectionSet
                            set:
                            - $type: CompositorValueSet
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        allowArrayExclude: true
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
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  allowArrayExclude: true
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: string
                                    useValue: true
                                  contentValue: true
                                  contentValueObj:
                                    $type: StringValue
                                    replacedColumn: ""
                                    value: 101 E. Huntington Drive
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  allowArrayExclude: true
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: string
                                    useValue: true
                                  contentValue: true
                                  contentValueObj:
                                    $type: StringValue
                                    replacedColumn: ""
                                    value: Monrovia
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  allowArrayExclude: true
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: string
                                    useValue: true
                                  contentValue: true
                                  contentValueObj:
                                    $type: StringValue
                                    replacedColumn: ""
                                    value: CA
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  allowArrayExclude: true
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: string
                                    useValue: true
                                  contentValue: true
                                  contentValueObj:
                                    $type: StringValue
                                    replacedColumn: ""
                                    value: 91016
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        allowArrayExclude: true
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: string
                          useValue: true
                        contentValue: true
                        contentValueObj:
                          $type: StringValue
                          replacedColumn: ""
                          value: 1-888-305-0041
                        compositorValue: true
                        compositorValueObj:
                          replacedColumn: ""
                          values:
                            $type: CompositorValueSetCollectionSet
                            set:
                            - $type: CompositorValueSet
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        allowArrayExclude: true
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: number
                          useValue: true
                        contentValue: true
                        contentValueObj:
                          $type: IntegerValue
                          replacedColumn: ""
                          value: 12345
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
            location: ""
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
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
        constrainToSchema: false
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
            HTTPClient_Endpoint: "${BASEURL}/billpay?accountId=12345&amount=1.0"
        urlParameters:
          properties:
          - name: accountId
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: 12345
          - name: amount
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: 1.0
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
            name: Traffic Object
        formXML:
          doctype: ""
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: |-
              {
                  "name" : "Parasoft Corporation",
                  "address" : {
                      "street" : "101 E. Huntington Drive",
                      "city" : "Monrovia",
                      "state" : "CA",
                      "zipCode" : "91016"
                  },
                  "phoneNumber" : "1-888-305-0041",
                  "accountNumber" : 12345
              }
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
              value: 12345
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
              value: billpay
        resourceMethod:
          resourceId: /billpay
          httpMethod: POST
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: https://parabank.parasoft.com/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
  - $type: TestSuite
    name: 1.1.1 - Basic REST Client - With Validation - Diff
    testID: 58
    notes: |-
      Here, you'll notice the same REST Client like in previous examples, except there is a new Tool chained to it's Response Traffic output, a Diff Tool.

      A Diff Tool does a context-aware diff of the response payload against an expected payload.  This is ideal when you are validating mostly static responses as it's a very quick and easy validation to setup.  The Diff Tool also supports ignored differences, so you can still do a diff on a response payload and ignore specific response properties that may be dynamic like a DateTime or UUID.

      When you run this Test, it will pass.  You can experiment by opening the Diff Tool and changing the Regression Control Source (i.e., expected output) and Ignored Differences to see how the Tool works.

      Adding a Diff Tool to a REST Client:
      While you could manually add the Diff Tool to a Test via Add Output context menu option, there is a shortcut to make things faster.
      1. Delete the current Diff Tool chained to this Test: "Response Traffic > Diff control generated on ..."
      2. Right click the Test > Create Regression Control > Create Internal Regression Control.  This will run the REST Client, copy the live response, and setup the Diff Tool for regression based on the live response.

      Troubleshooting:
      * If the Test initially fails with unexpected differences: Go to http://parabank.parasoft.com/ in a web browser, click the Admin Page link, click the Database > Initialize button, then try again.
    tests:
    - $type: RESTClientToolTest
      name: "/accounts/{accountId} - GET"
      testID: 59
      performanceGroup: 0
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: "/accounts/{accountId} - GET"
        outputTools:
        - $type: DiffTool
          iconName: Diff
          name: "Diff control generated on Nov 14, 2025, 2:04:19 PM."
          differs:
          - $type: JSONDiffer
          source:
            controls:
            - keys:
              - ""
              - ""
              row:
                refs:
                - dataSourceName: ""
                last: false
            - "{\"id\":12345,\"customerId\":12212,\"type\":\"CHECKING\",\"balance\"\
              :-2302.00}"
          mode: 3
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
              value: 12345
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
    name: 1.1.2 - Basic REST Client - With Validation - Assertor
    testID: 60
    notes: |-
      Here, you'll notice a different REST Client than the previous example.  This REST Client is working with a /customers resource that returns multiple accounts for a given customerId, so we can have more interesting data to work with for validation.  Notice there is a new Tool chained to it's Response Traffic output, a JSON Assertor Tool.

      The JSON (and XML) Assertor Tools offer a wide variety of assertions that make complex data validation easy and scriptless.  Whether you need to work with numbers, strings, dates, ranges, response structure, regular expressions, or even compound logic with multiple assertions, this is possible without needing to resort to scripting, which is also supported as a Custom Assertion.  Assertor Tools, in contrast to Diff Tools, are ideal when you have specific data validation requirements against dynamic response payloads.

      Open the JSON Assertor and review the Configuration tab to see some pre-made examples of assertions being performed on the response payload that this REST Client receives.

      Click the Add button to review all the possible assertion types possible in the Assertor Tool.  Notice when you add an Assertion, you are presented with a tree view of the response payload to make selecting the element you want to assert easy.  SOAtest will generate an XPath automatically to select that node you selected.  For advanced users, you can also manually edit the XPath by clicking on the "Change Element" button in an existing assertion.

      Troubleshooting:
      * If you don't see the tree view populated when adding a new assertion, run the test first and then try adding the assertion again.
      * If the Test initially fails with assertion failures: Go to http://parabank.parasoft.com/ in a web browser, click the Admin Page link, click the Database > Initialize button, then try again.
    tests:
    - $type: RESTClientToolTest
      name: "/customers/{customerId}/accounts - GET"
      testID: 62
      performanceGroup: 11
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: "/customers/{customerId}/accounts - GET"
        outputTools:
        - $type: GenericAssertionTool
          iconName: XMLAssertor
          name: JSON Assertor
          wrappedTool:
            $type: XMLAssertionTool
            iconName: XMLAssertor
            name: XML Assertor
            assertions:
            - $type: ValueAssertion
              timestamp: 1763149397734
              name: Basic Value Assertion - Checking First Object's Type Field = CHECKING
              extractEntireElement: true
              Assertion_XPath: "/root/item[1]/type/string()"
              value:
                name: Value
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: CHECKING
            - $type: ValueAssertion
              timestamp: 1763149467829
              name: Basic Value Assertion - Checking All Object customerId Fields
                = 12212
              extractEntireElement: true
              Assertion_XPath: /root/item/customerId/string()
              value:
                name: Value
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: 12212
            - $type: OccurrenceAssertion
              timestamp: 1763149508822
              name: Occurrence Assertion - Checking There Are 11 Accounts Being Returned
              extractEntireElement: true
              Assertion_XPath: /root/item
              value:
                name: Count
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: 11
            - $type: NumericAssertion
              timestamp: 1763149604929
              name: Numeric Assertion - Checking All Balances > -$3000
              Assertion_XPath: /root/item/balance
              operator: 4
              value:
                name: Numeric
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: -3000
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
    name: 1.1.3 - Basic REST Client - With Validation - Validator
    testID: 63
    notes: |-
      Here, you'll notice Test 1 is the same REST Client like the previous examples, except there is a new Tool chained to it's Response Traffic output, a JSON Validator Tool.

      A JSON (and XML) Validator Tool does contract validation on the API response to make sure it:
      a) Is well-formed JSON (or XML)
      b) Conforms to the schema defined by the service definition

      Validator Tools are ideal to include with your API tests to make sure that the API contract is always in sync with the behavior of the API.  This can help catch integration issues early, before more robust API consumer-side testing takes place.

      When you run Test 1, it will pass.  You can experiment by opening the Validaor Tool and changing the schema to a different resource just to see what a failure message might look like.

      You'll also see Test 2, a standalone Tool called the OpenAPI/Swagger Validator.  This is a simple Tool that checks your OpenAPI or Swagger service definition against the OpenAPI/Swagger spec itself, to catch any fundamental issues with your service definition.  While the JSON Validator is checking your API responses to make sure they conform to your service definition, this Tool is checking that there are no issues with your service definition itself.
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
        - $type: JSONValidator
          iconName: ValidateJSON
          name: JSON Validator
          definitionLocation: true
          definitionLocationObj:
            path: "${OPENAPI}"
          messageId: "/accounts/{accountId} - GET - 200"
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
              value: 12345
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
    - $type: ToolTest
      name: OpenAPI/Swagger Validator
      testID: 86
      tool:
        $type: SwaggerValidator
        iconName: SwaggerValidator
        name: OpenAPI/Swagger Validator
        definitionUrl: "${OPENAPI}"
        errorsOutput:
          name: Errors
  - $type: TestSuite
    name: 1.2.1 - Data Driven REST Client
    testID: 65
    notes: |-
      Here, you'll notice the same REST Client like the previous example, except there is a new node in the Test Suite, a Table Data Source named "Test Data 1-2-1".

      SOAtest supports a variety of Data Source types, with Table being a built-in, simple table, that does not have an external dependency.  Right click the Data Sources node > Add New > Data Source to see the available types.

      Open the REST Client and notice that the accountId path parameter has been configured to be Parameterized instead of Fixed like in previous examples.  This REST Client is now configured to loop through the data source to send multiple request messages to the API for each row.  When you run the Test, notice that SOAtest tells you that 4 Tests Succeeded.  Upon opening the Traffic Viewer, you can also see that the request/response traffic for each data source row is inspectable.
    dataSources:
    - id: ds_1275906716_1763150821706_621798800
      impl:
        $type: TableDataSource
        model:
          columnIdentifiers:
          - accountId
          rows:
          - - 12345
          - - 12456
          - - 12567
          - - 12678
      name: Test Data 1-2-1
      useAllRows: true
    tests:
    - $type: RESTClientToolTest
      name: "/accounts/{accountId} - GET"
      testID: 66
      performanceGroup: 0
      tool:
        $type: RESTClient
        dataSourceNames:
        - Test Data 1-2-1
        iconName: RESTClient
        name: "/accounts/{accountId} - GET"
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
            columnName: accountId
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
              value: 12345
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
    name: 1.2.2 - Data Driven REST Client - With Validation - Diff
    testID: 67
    notes: |
      Here, you'll notice the same REST Client and Data Source like the previous example, except there is now a Diff Tool chained to the REST Client.

      We are combining the 1.1.1 Diff example with the previous 1.2.1 Data Driven example.

      Open the Diff Tool chained to Test 1 and notice that there is now a menu for Multiple controls that has an expected response payload for each Data Source row.

      Following the same shortcut described in example 1.1.1:
      1) Delete the Diff Tool chained to Test 1 in this Test Suite
      2) Right click the Test > Create Regression Control > Create Multiple Controls > Create Internal Regression Controls.  The feature is aware that the test is data-driven with a Data Source.  This will loop running the REST Client for each Data Source row, copy the live response for each row, and setup the Diff Tool for with Multiple regression controls based on each live response that was received.

      Troubleshooting:
      * If the Test initially fails with unexpected differences: Go to http://parabank.parasoft.com/ in a web browser, click the Admin Page link, click the Database > Initialize button, then try again.
    dataSources:
    - id: ds_1275906716_1763150821706_621798800
      impl:
        $type: TableDataSource
        model:
          columnIdentifiers:
          - accountId
          rows:
          - - 12345
          - - 12456
          - - 12567
          - - 12678
      name: Test Data 1-2-2
      useAllRows: true
    tests:
    - $type: RESTClientToolTest
      name: "/accounts/{accountId} - GET"
      testID: 68
      performanceGroup: 0
      tool:
        $type: RESTClient
        dataSourceNames:
        - Test Data 1-2-2
        iconName: RESTClient
        name: "/accounts/{accountId} - GET"
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
            columnName: accountId
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
              value: 12345
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
    name: 1.2.3 - Data Driven REST Client - With Validation - Assertor
    testID: 77
    notes: |-
      Here, you'll notice the same REST Client and Data Source like the previous example, except there is now a JSON Assertor chained to the REST Client and the Data Source has a second column in the table.

      We are expanding the previous example to not only loop through a data source with a variety of inputs, but we now also have an expected output column for validating the responses associated with each row.

      Open the JSON Assertor and see that the Expected Value has been changed from Fixed to Parameterized and it is now linked to the expectedBalance Data Source column.

      You can experiment with changing the data to see what a failure would look like.

      Troubleshooting:
      * If the Test initially fails with unexpected assertion failures: Go to http://parabank.parasoft.com/ in a web browser, click the Admin Page link, click the Database > Initialize button, then try again.
    dataSources:
    - id: ds_1275906716_1763150821706_621798800
      impl:
        $type: TableDataSource
        model:
          columnIdentifiers:
          - accountId
          - expectedBalance
          rows:
          - - 12345
            - -2302.00
          - - 12456
            - 10.45
          - - 12567
            - 100.00
          - - 12678
            - -100.00
      name: Test Data 1-2-3
      useAllRows: true
    tests:
    - $type: RESTClientToolTest
      name: "/accounts/{accountId} - GET"
      testID: 78
      performanceGroup: 0
      tool:
        $type: RESTClient
        dataSourceNames:
        - Test Data 1-2-3
        iconName: RESTClient
        name: "/accounts/{accountId} - GET"
        outputTools:
        - $type: GenericAssertionTool
          dataSourceNames:
          - Test Data 1-2-3
          iconName: XMLAssertor
          name: JSON Assertor
          wrappedTool:
            $type: XMLAssertionTool
            dataSourceNames:
            - Test Data 1-2-3
            iconName: XMLAssertor
            name: XML Assertor
            assertions:
            - $type: NumericAssertion
              timestamp: 1763151326076
              name: Check Account Balance With Data Source Expected Value Column
              Assertion_XPath: /root/balance
              value:
                name: Numeric
                value:
                  fixedValue:
                    $type: StringTestValue
                  parameterizedValue:
                    column: expectedBalance
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
            columnName: accountId
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
              value: 12345
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
    name: "Util: Reset Parabank Database 2"
    testID: 81
    notes: Some of the operations performed by the Tests in this Test (.tst) File
      alter the data of Parabank.  Running this Test Suite will re-initialize the
      Parabank database back to its starting state.
    tests:
    - $type: RESTClientToolTest
      name: /initializeDB - POST
      testID: 82
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
