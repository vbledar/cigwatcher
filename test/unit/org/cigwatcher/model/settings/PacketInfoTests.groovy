package org.cigwatcher.model.settings



import grails.test.mixin.*
import org.cigwatcher.model.user.User
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(PacketInfo)
class PacketInfoTests {

    void packetInfoCreation() {
        // mock user instance
        User user = mockDomain(User)

        // create packet info instance
        PacketInfo packetInfo = new PacketInfo(packetName: "Marlboroasdfa", price: 3.40, cigCount: 20)
        packetInfo.user = user

        // assert saving the instance
        assertNull packetInfo.save()

        packetInfo.packetName = 'Marlboro'
        assertNotNull packetInfo.save()
    }
}
