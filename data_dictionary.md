`orders`:

| Column       | Definition                           | Data type          | Comments                                          |
| ------------ | ------------------------------------ | ------------------ | ------------------------------------------------- |
| `row_id`     | Unique Record ID                     | `INTEGER`          |                                                   |
| `order_id`   | Identifier for each order in table   | `TEXT`             | Connects to `order_id` in `returned_orders` table |
| `order_date` | Date when order was placed           | `TEXT`             |                                                   |
| `market`     | Market order_id belongs to           | `TEXT`             |                                                   |
| `region`     | Region Customer belongs to           | `TEXT`             | Connects to `region` in `people` table            |
| `product_id` | Identifier of Product bought         | `TEXT`             | Connects to `product_id` in `products` table      |
| `sales`      | Total Sales Amount for the Line Item | `DOUBLE PRECISION` |                                                   |
| `quantity`   | Total Quantity for the Line Item     | `DOUBLE PRECISION` |                                                   |
| `discount`   | Discount applied for the Line Item   | `DOUBLE PRECISION` |                                                   |
| `profit`     | Total Profit earned on the Line Item | `DOUBLE PRECISION` |                                                   |

