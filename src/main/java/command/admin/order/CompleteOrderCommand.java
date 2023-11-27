package command.admin.order;

import command.Command;
import command.CommandResult;
import entity.types.OrderStatus;
import exception.ServiceException;
import service.OrderService;
import util.Validation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * Designed to complete order.
 */

public class CompleteOrderCommand implements Command {

    private static final String ADMIN_ORDERS = "controller?command=showAllOrders";
    private static final String DATE_PATTERN = "yyyy-MM-dd";
    private static final String ID = "activeId";

    /**
     * Process the request, complete order and generates a result of processing in the form of
     * {@link command.CommandResult} object.
     *
     * @param request  an {@link HttpServletRequest} object that contains client request
     * @param response an {@link HttpServletResponse} object that contains the response the servlet sends to the client
     * @return A response in the form of {@link command.CommandResult} object.
     * @throws ServiceException when RepositoryException is caught.
     */

    @Override
    public CommandResult execute(HttpServletRequest request, HttpServletResponse response) throws ServiceException {
        Validation validation = new Validation();
        String stringId = request.getParameter(ID);

        if (!validation.isValidData(ID, stringId)) {
            return CommandResult.redirect(ADMIN_ORDERS);
        }

        Integer id = Integer.valueOf(stringId);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DATE_PATTERN);
        LocalDate date = LocalDate.parse(LocalDate.now().format(formatter), formatter);
        Date currentDate = Date.valueOf(date);

        OrderService orderService = new OrderService();
        orderService.completeOrder(id, currentDate, OrderStatus.COMPLETED);

        return CommandResult.redirect(ADMIN_ORDERS);
    }
}
