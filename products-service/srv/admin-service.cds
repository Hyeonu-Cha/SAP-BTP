using { sap.capire.products as db } from '../db/schema';
annotate AdminService @(requires: 'Administrators');

service AdminService {
    entity Products   as projection on db.Products;
    entity Categories as projection on db.Categories;
}

// Define Orders Service
service OrdersService {
    @(restrict: [
        { grant: '*', to: 'Administrators' },
        { grant: '*', where: 'createdBy = $user' }
    ])
    entity Orders as projection on db.Orders;

    @(restrict: [
        { grant: '*', to: 'Administrators' },
        { grant: '*', where: 'parent.createdBy = $user' }
    ])
    entity OrderItems as projection on db.OrderItems;
}
