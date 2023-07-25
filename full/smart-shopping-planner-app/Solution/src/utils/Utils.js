
// total number of items
export const totalItems = (items) => {
    return items.reduce((total, item) => {
        return total + item.quantity;
    }, 0);
};

// total cost of all items
export const totalCost = (items) => {
    return items.reduce((total, item) => {
        return total + (item.quantity * item.unitPrice);
    }, 0);
};

//all categories to be used in the select input in the UI
export const categories = [
    {
        value: 'Utensils',
        label: 'Utensils',
    },
    {
        value: 'Furniture',
        label: 'Furniture',
    },
    {
        value: 'Kitchen Wear',
        label: 'Kitchen Wear',
    },
    {
        value: 'Bathroom Wear',
        label: 'Bathroom Wear',
    },
    {
        value: 'Food Items',
        label: 'Food Items',
    },
    {
        value: 'Office Wear',
        label: 'Office Wear',
    },
];

