-- Listing 12-1

DECLARE @docHandle int;

DECLARE @xmlDocument nvarchar(max) = N'<Customers>
    <Customer CustomerID="1234" ContactName="Larry" CompanyName="APress">
       <Orders>
          <Order  CustomerID="1234"    OrderDate="2006-04-25T13:22:18"/>
          <Order  CustomerID="1234"    OrderDate="2006-05-10T12:35:49"/>
       </Orders>
    </Customer>
    <Customer CustomerID="4567" ContactName="Bill" CompanyName="Microsoft">
       <Orders>
          <Order  CustomerID="4567"    OrderDate="2006-03-12T18:32:39"/>
          <Order  CustomerID="4567"    OrderDate="2006-05-11T17:56:12"/>
       </Orders>
    </Customer>
</Customers>';

EXECUTE sp_xml_preparedocument @docHandle OUTPUT, @xmlDocument;

SELECT
        Id,
        ParentId,
        NodeType,
        LocalName,
        Prefix,
        NameSpaceUri,
        DataType,
        Prev,
        [Text]
FROM  OPENXML(@docHandle, N'/Customers/Customer');

EXECUTE sp_xml_removedocument @docHandle;
GO
